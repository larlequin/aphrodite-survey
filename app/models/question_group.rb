class QuestionGroup < ActiveRecord::Base
  has_and_belongs_to_many :student_groups
end
