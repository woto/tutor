# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
math = Discipline.create(title: "Mathematics")
math.discipline_areas << DisciplineArea.new(title: 'Differential calculus')
math.discipline_areas << DisciplineArea.new(title: 'Trigonometry')
math.discipline_areas << DisciplineArea.new(title: 'Complex number')
math.discipline_areas << DisciplineArea.new(title: 'Integral')
math.discipline_areas << DisciplineArea.new(title: 'Elementary algebra')
phisics = Discipline.create(title: "Physics")
phisics.discipline_areas << DisciplineArea.new(title: 'Electrostatics')
phisics.discipline_areas << DisciplineArea.new(title: 'Magnetism')
phisics.discipline_areas << DisciplineArea.new(title: 'Chaos theory')
Discipline.create(title: "Chemistry")
Discipline.create(title: "Biology")
Discipline.create(title: "Astronomy")
