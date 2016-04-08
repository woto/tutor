module Concerns::DisciplinesConcern
  extend ActiveSupport::Concern

  included do
    attr_accessor :users_disciplines_form

    def initialize(model, options={})
      self.users_disciplines_form = []
      super
    end

    def prepopuleate_disciplines_form!(type)
      self.users_disciplines_form = model.users_disciplines.send(type).ordered_by_discipline_title.map do |ud|
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
  end


  def users_disciplines_form_attributes=(args={})
    args.each do |arg|
      index, params = arg
      active = params.delete(:active)
      if (id = params[:id]).present?
        user_discipline = model.users_disciplines.find(id.to_i)
        user_discipline.assign_attributes(params)
      else
        user_discipline = UsersDisciplines.new(params)
      end
      self.users_disciplines_form << UsersDisciplinesForm.new(user_discipline, active: active)
    end
  end

  private

  def active_disciplines_valid?
    users_disciplines_form.select{|udf| udf.active == '1'}.map(&:valid?)
  end

  def find_insert_index(udf, discipline)
    # TODO make in better
    arr = users_disciplines_form.map{|udf| udf.model.discipline.title}
    arr << discipline.title
    arr.sort!
    arr.index(discipline.title)
  end

  def process_disciplines_form(type)
    debugger
    users_disciplines_form.each do |udf|
      if (active = udf.active) == '1'
        if (id = udf.id)
          model.users_disciplines.find(id).update!({
            discipline_areas: udf.discipline_areas,
            discipline_year: udf.discipline_year,
            discipline_grade: udf.discipline_grade
          })
        else
          model.users_disciplines.create!({
            discipline_id: udf.discipline_id,
            discipline_type: type,
            discipline_areas: udf.discipline_areas,
            discipline_year: udf.discipline_year,
            discipline_grade: udf.discipline_grade
          })
        end
      else
        if (id = udf.id)
          model.users_disciplines.find(id).destroy!
        end
      end
    end
  end

end
