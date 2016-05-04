class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :key
      t.string :name
      t.integer :group_id
      t.boolean :only_not_living
      t.string :min
      t.string :max
      t.timestamps
      # Pour l'estimation du temps de réponse
      t.datetime :start
      t.datetime :end
    end
  end
end
