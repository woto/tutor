class UserProfileForm
  include ActiveModel::Model
  include Extras

  attr_accessor :users_disciplines_form

  validates :undergraduate_school, :graduate_school, :first_name, presence: true
  validates :school_year, inclusion: { in: Constants::YEARS.map(&:last)}

  def initialize(args={})
    super
    self.users_disciplines_form = []
  end

  def call(args={})
    self.assign_attributes(args)

    valid?
    users_disciplines_form.select{|udf| udf.active == '1'}.each{|udf| udf.valid?}

    return false
  end

  def school_year=(args)
    @school_year = args.to_i
  end

  def prepopulate_users_disciplines_form!
    self.users_disciplines_form = model.users_disciplines.ordered_by_discipline_title.map do |ud|
      UsersDisciplinesForm.new(ud)
    end

    Discipline.all.order(:title).each do |discipline|
      udf = users_disciplines_form.find{|udf| udf.model.discipline_id == discipline.id}
      if udf
        udf.active = true
      else
        index = find_insert_index(udf, discipline)
        users_disciplines_form.insert(index, UsersDisciplinesForm.new(
          UsersDisciplines.new(discipline: discipline, discipline_grade: 50)))
      end
    end
  end

  def users_disciplines_form_attributes=(args={})
    args.each do |arg|
      index, params = arg
      active = params.delete(:active)
      if (id = params[:id])
        user_discipline = model.users_disciplines.find(id.to_i)
        user_discipline.assign_attributes(params)
      else
        user_discipline = UsersDisciplines.new(params)
      end
      self.users_disciplines_form << UsersDisciplinesForm.new(
        user_discipline, active: active, discipline_type: 'teach')
    end
  end

  private

  def find_insert_index(udf, discipline)
    # TODO rewrite better
    arr = users_disciplines_form.map{|udf| udf.model.discipline.title}
    arr << discipline.title
    arr.sort!
    arr.index(discipline.title)
  end

end
