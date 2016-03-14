require 'set'

module Extras

  extend ActiveSupport::Concern
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveRecord::AttributeAssignment

  attr_accessor :model
  #attr_accessor :column_names


  def method_missing(m, *args, &block)
    # TODO rewrite with checking ActiveRecord model attributes names
    variable_name = "#{m.to_s.gsub(/=$/, '')}"
    if model.class.column_names.include? variable_name
      #column_names << variable_name
      if m =~ /=$/
        define_singleton_method(m) do |value|
          instance_variable_set("@#{variable_name}", value)
          return value # TODO
        end
      elsif instance_variable_defined?("@#{variable_name}")
        define_singleton_method(m) do
          instance_variable_get("@#{variable_name}")
        end
      end
      method(m).call *args
    else
      model.send m, *args, &block
    end
  end

  def initialize(model, options={})

    self.model = model
    #self.column_names = Set.new
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
