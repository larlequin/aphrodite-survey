class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.string :name
      t.integer :group_id
      t.boolean :only_alive_word

      t.timestamps
    end
  end
end
