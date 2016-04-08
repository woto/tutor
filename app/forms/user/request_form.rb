class User::RequestForm
  include Extras
  include Concerns::DisciplinesConcern

  define_model_callbacks :create, :destroy, :update, :save, :commit

  def call(args={})
    self.assign_attributes args

    valid = ([valid?] + active_disciplines_valid?).all?
    if valid
      run_callbacks :save do
        model.assign_attributes({
          learn_fee: learn_fee
        })
        process_disciplines_form('learn')
        model.save!
      end
      true
    else
      errors.add(:base, '')
      false
    end
  end

  def users_disciplines_form_attributes=(args={})
    args.transform_values do |v|
      v['discipline_type'] = 'learn'
    end
    super
  end

  def prepopulate_request_form!
    prepopuleate_disciplines_form! 'learn'
  end

end
