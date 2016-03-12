class UserProfileForm < Reform::Form
  #include Reform::Form::ModelValidations
  include ActiveModel::ModelReflections

  validates :undergraduate_school, :graduate_school, :first_name, :last_name, presence: true
  validates :school_year, inclusion: { in: Constants::YEARS.map{|y| y.first.to_s} }

  property :first_name
  property :last_name
  property :undergraduate_school
  property :graduate_school
  property :school_year
  property :teach_fee
  property :avatar
  property :about

  collection :disciplines_users, inherit: true,
    prepopulator: :prepopulate_disciplines_users,
    populator: :populate_disciplines_users do
    property :discipline_areas
    property :discipline_year
    property :discipline_id
    property :active, virtual: true

    #include Reform::Form::ActiveRecord
    extend Reform::Form::ModelValidations

    copy_validations_from DisciplinesUser
  end

  private

  def prepopulate_disciplines_users(options)
    Discipline.all.each do |discipline|
      du = disciplines_users.find{|du| du.model.discipline_id == discipline.id}
      if du
        du.active = '1'
      else
        # TODO to rewrite better
        arr = disciplines_users.map{|du| du.model.discipline.title}
        arr << discipline.title
        arr.sort!
        index = arr.index(discipline.title)
        disciplines_users.insert(index, DisciplinesUser.new(discipline: discipline))
      end
    end
  end

  def populate_disciplines_users(collection:, index:, fragment:, **)
    item = collection.find{|du| du.model.discipline_id == fragment[:discipline_id].to_i}
    # if adding discipline
    if fragment[:active] == '1'
      # if discipline already stored in db
      if item
        return item
      # if new discipline
      else
        collection.insert(collection.length, DisciplinesUser.new(discipline_year: fragment[:discipline_year], 
                                                     discipline_areas: fragment[:discipline_areas],
                                                     discipline_year: fragment[:discipline_year],
                                                     user_id: id,
                                                     discipline_id: fragment[:discipline_id]))
      end
    # if removing discipline
    else
      # if discipline stored in db
      if fragment[:active] == '0'
        disciplines_users.destroy(item)
      end
      return skip!
    end
  end

end
