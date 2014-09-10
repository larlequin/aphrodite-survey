class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :alive
      t.string :sound
      t.string :size

      t.timestamps
    end
  end
end
