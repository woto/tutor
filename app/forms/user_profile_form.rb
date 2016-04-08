class UserProfileForm
  include Extras
  include UserAvatarActiveModel
  include UserAvatarValidations
  include Concerns::DisciplinesConcern

  validates :undergraduate_school, :graduate_school, :first_name, :last_name, presence: true
  validates :school_year, inclusion: { in: Constants::YEARS.map(&:last), message: 'please choose year'}

  def call(args={})

    self.assign_attributes args

    valid = ([valid?] + active_disciplines_valid?).all?

    if valid
      debugger
      run_callbacks :save do
        model.assign_attributes({
          first_name: first_name,
          last_name: last_name,
          undergraduate_school: undergraduate_school,
          graduate_school: graduate_school,
          school_year: school_year,
          phone: phone,
          skype: skype,
          about: about,
          teach_fee: teach_fee
        })

        process_disciplines_form('teach')
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
      v['discipline_type'] = 'teach'
    end
    super
  end

  def school_year=(args)
    @school_year = args.to_i
  end

  def prepopulate_user_profile_form!
    prepopuleate_disciplines_form!('teach')
  end

end
