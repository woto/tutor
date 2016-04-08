class UserAvatarForm

  include Extras
  extend ActiveModel::Callbacks
  include UserAvatarActiveModel
  include UserAvatarValidations

  ##after_save :store_avatar!
  ##before_save :write_avatar_identifier
  ##after_commit :remove_avatar!, on: :destroy
  #after_commit :mark_remove_avatar_false, on: :update
  ##after_save :store_previous_changes_for_avatar
  #after_commit :remove_previously_stored_avatar, on: :update

  def call(args={})
    assign_attributes(args)
    if valid?
      run_callbacks :save do
        model.save
      end
    end
  end

end
