class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :min
      t.string :max
      t.timestamps
    end
  end
end
