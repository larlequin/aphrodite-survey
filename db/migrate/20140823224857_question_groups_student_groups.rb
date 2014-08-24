class QuestionGroupsStudentGroups < ActiveRecord::Migration
  def change
    create_table :question_groups_student_groups, id: false do |t|
      t.belongs_to :question_group
      t.belongs_to :student_group
    end
  end
end
