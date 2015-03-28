class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :student_group_id
      t.datetime :start
      t.datetime :stop
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.string :question5
      t.string :trouble

      t.timestamps
    end
  end
end
