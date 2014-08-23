class User < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  belongs_to :student_group
  validates :student_group_id, presence: true
end
