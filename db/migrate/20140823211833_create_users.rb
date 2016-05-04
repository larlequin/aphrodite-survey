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
      t.string :trouble

      t.timestamps

      t.string :email
      t.string :firstname
      t.date :birthdate
      t.string :quebeker
      t.integer :yearsquebec
      t.string :mothertongue
      t.string :languages
      t.integer :education
      t.string :highestscol
      t.string :neurotb
      t.string :psytb
      t.string :medoc
      t.string :session_token
    end
  end
end
