class Answer < ActiveRecord::Base
    validates :user_id, presence: true
    validates :question_id, presence: true
    validates :word_id, presence: true
end
