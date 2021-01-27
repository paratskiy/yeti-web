# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  ALLOWED_ACTIONS = %i[read change remove perform].freeze

  class_attribute :_section_name, instance_writer: false
  class_attribute :root_role, instance_writer: false
  self.root_role = :root

  class << self
    def inherited(subclass)
      subclass.section(nil)
    end

    def section(section_name)
      self._section_name = section_name&.to_sym
    end
  end

  def read?
    allowed_for_role?(:read)
  end

  def create?
    allowed_for_role?(:change)
  end

  def update?
    allowed_for_role?(:change)
  end

  def destroy?
    allowed_for_role?(:remove)
  end

  def perform?
    allowed_for_role?(:perform)
  end

  alias_rule :import?, to: :perform? # ActiveAdminImport::Auth::IMPORT
  alias_rule :do_import?, to: :import? # active_admin_import

  alias_rule :batch_insert?, :batch_replace?, :batch_update?, :delete_all?,
             to: :perform?

  private

  # action could be one of [:read, :change, :remove, :perform]
  def allowed_for_role?(action)
    return true if user_root?
    if RolePolicy::ALLOWED_ACTIONS.exclude?(action)
      raise ArgumentError, "#{action} is not one of #{RolePolicy::ALLOWED_ACTIONS}"
    end
    return rule_when_no_config if roles_config.nil?

    user_roles.any? { |role| roles_config.dig(role, section_name, action) }
  end

  def user_root?
    user && root_role && user.roles.reject(&:blank?).map(&:to_sym).include?(root_role)
  end

  def user_roles
    user.roles.reject(&:blank?).map(&:to_sym)
  end

  def roles_config
    Rails.configuration.policy_roles
  end

  def rule_when_no_config
    Rails.configuration.yeti_web['role_policy']['when_no_config'].to_sym == :allow
  end

  def section_name
    _section_name || self.class.to_s[0...-6].gsub('::', '/').to_sym
  end
end
