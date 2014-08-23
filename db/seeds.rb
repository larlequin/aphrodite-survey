# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
LIST_STUDENT_GROUP = [
  'TD1',
  'TD2',
  'TD3',
  'TD4',
]


LIST_STUDENT_GROUP.each do | name |
  StudentGroup.create(name: name)
end
