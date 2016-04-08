module UserAvatarActiveModel

  extend ActiveSupport::Concern
  include ActiveModel::Dirty

  included do
    extend CarrierWave::ActiveRecord

    define_attribute_methods :avatar
    define_model_callbacks :create, :destroy, :update, :save, :commit

    def read_attribute(column)
      model.read_attribute(column)
    end

    def write_attribute(column, identifier)
      model.write_attribute(column, identifier)
      #model.avatar_will_change!
      #instance_variable_set("@#{column}", identifier)
    end

  end

end
