class User < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :td, presence: true
end
