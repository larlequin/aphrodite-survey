class Word < ActiveRecord::Base
  has_and_belongs_to_many :questions

  def get_question(user_id)
    user = User.find(user_id)
    question_group_ids = user.student_group.question_group_ids

    valid_questions = []
    questions.each do | question |
      if question_group_ids.include?(question.group_id)
        valid_questions.append(question)
      end
    end
    return valid_questions
  end

end
