class QuestionsWords < ActiveRecord::Migration
  def change
    create_table :questions_words, id: false do |t|
      t.belongs_to :question
      t.belongs_to :word
    end
  end
end
