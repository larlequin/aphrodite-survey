class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.boolean :alive

      t.timestamps
    end
  end
end
