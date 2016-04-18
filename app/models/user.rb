# Update user model to add new questions
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :firstname, presence:true
  validates :age, presence: true
  validates :email, presence: true
  validates :birthdate, presence:true
  validates :gender, presence: true
  validates :quebeker, presence:true
  validates :yearsquebec, presence:false
  validates :mothertongue, presence:true
  validates :languages, presence:true
  validates :education, presence:true
  validates :highestscol, presence:true
  validates :question1, presence:true
  validates :question2, presence:true
  validates :neurotb, presence:true
  validates :psytb, presence:true
  validates :medoc, presence:true
end
