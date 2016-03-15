module Extras

  extend ActiveSupport::Concern
  include ActiveModel::Model

  attr_accessor :model

  def initialize(model, options={})

    self.model = model

    model.attributes.each do |attr|
      m = attr.first
      singleton_class.class_eval{attr_writer m} unless respond_to? "#{m}="
      singleton_class.class_eval{attr_reader m} unless respond_to? m
    end

    super model.attributes.merge(options)
  end
end
