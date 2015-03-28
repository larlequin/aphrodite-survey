class User < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :question1, presence: true
  validates :question2, presence: true
  validates :question3, presence: true
  validates :question4, presence: true
  validates :question5, presence: true
end
