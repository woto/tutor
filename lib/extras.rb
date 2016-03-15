module Extras

  extend ActiveSupport::Concern
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveRecord::AttributeAssignment

  attr_accessor :model

  def method_missing(m, *args, &block)
    # Messy associations
  end

  def initialize(model, options={})

    self.model = model

    model.attributes.each do |attr|
      m = attr.first
      singleton_class.class_eval{attr_writer m} unless respond_to? "#{m}="
      singleton_class.class_eval{attr_reader m} unless respond_to? m
    end

    super model.attributes.merge(options)

    self.model.class.validators.each do |validator|
      begin
        self.class.validates(*validator.attributes, {validator.kind => validator.options})
      rescue
        # Unknowns validators
      end
    end
  end
end
