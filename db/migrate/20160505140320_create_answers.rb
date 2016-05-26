class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :question_id
      t.integer :value
      t.float :response_time
      t.timestamps
    end
  end
end
