# frozen_string_literal: true

require 'securerandom'

module JsonapiModel
  class Base
    include ActiveModel::Model
    attr_reader :id

    class << self
      def inherited(_subclass); end

      def call(args = {})
        new(args).call
      end
    end

    def initialize(attributes = {})
      @id = SecureRandom.uuid
      assign_attributes(attributes)
    end

    def save(validate: true)
      if !validate || valid?
        _save
        errors.empty?
      else
        false
      end
    end

    def call
      raise NotImplementedError, 'call needs to be implemented in subclasses and return self'
    end

    def self.all
      new
    end

    def order(*_args)
      [self]
    end

    def count(*_args)
      1
    end
  end
end
