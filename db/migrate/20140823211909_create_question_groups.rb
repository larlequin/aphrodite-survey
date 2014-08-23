class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
      t.string :name
      t.integer :student_group_id

      t.timestamps
    end
  end
end
