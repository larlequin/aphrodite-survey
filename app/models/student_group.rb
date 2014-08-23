class StudentGroup < ActiveRecord::Base
  has_many :users
end
