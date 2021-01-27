# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer(4)       not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  enabled                :boolean          default(TRUE)
#  encrypted_password     :string(255)      default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  per_page               :json             not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  roles                  :string           not null, is an Array
#  saved_filters          :json             not null
#  sign_in_count          :integer(4)       default(0)
#  ssh_key                :text
#  stateful_filters       :boolean          default(FALSE), not null
#  username               :string           not null
#  visible_columns        :json             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  admin_users_username_idx                   (username) UNIQUE
#  admin_users_username_key                   (username) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class AdminUser < ActiveRecord::Base
  include Yeti::ResourceStatus

  has_one :billing_contact, class_name: 'Billing::Contact', dependent: :destroy, autosave: true

  before_validation do
    self.roles = roles.reject(&:blank?) unless roles.nil?
  end

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :validate_email? }
  validates :roles, presence: true

  after_save do
    contact = billing_contact || build_billing_contact
    contact.update!(email: email) if @email
  end

  before_destroy :check_if_last

  def self.from_token_request(request)
    name = request.params[:auth].is_a?(Hash) && request.params[:auth][:username]
    name.present? ? find_by(username: name) : nil
  end

  def self.ldap?
    AdminUser.devise_modules.include?(:ldap_authenticatable)
  end

  def self.ldap_config
    Rails.root.join 'config/ldap.yml'
  end

  def self.ldap_config_exists?
    File.exist?(ldap_config)
  end

  def self.available_roles
    list = (Rails.configuration.policy_roles&.keys || []).map(&:to_sym)
    list.push(RolePolicy.root_role) if RolePolicy.root_role.present?
    list
  end

  if ldap_config_exists?
    include AdminUserLdapHandler
  else
    include AdminUserDatabaseHandler
  end

  def email
    @email ||= billing_contact&.email
  end

  attr_writer :email

  def display_name
    username
  end

  def customized_update(params)
    if params[:password].present? || params[:password_confirmation].present?
      update_with_password params
    else
      attrs = params.except(:password, :password_confirmation)
      if respond_to?(:update_without_password)
        update_without_password attrs # db auth
      else
        update(attrs) # ldap
      end
    end
  end

  def update_with_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update(params, *options)
    clean_up_passwords
  end

  def active_for_authentication?
    super && enabled?
  end

  def validate_email?
    new_record? || @email.present?
  end

  ##### devise ####
  def email_required?
    false
  end

  def email_changed?
    false
  end

  # https://github.com/plataformatec/devise/issues/4542
  def will_save_change_to_email?
    false
  end

  protected

  def check_if_last
    if self.class.count.zero?
      errors.add(:base, "Last admin user can't  be deleted")
      throw(:abort)
    end
  end
end
