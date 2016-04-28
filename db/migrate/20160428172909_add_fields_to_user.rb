class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :firstname, :string
    add_column :users, :birthdate, :date
    add_column :users, :quebeker, :string
    add_column :users, :yearsquebec, :integer
    add_column :users, :mothertongue, :string
    add_column :users, :languages, :string
    add_column :users, :education, :integer
    add_column :users, :highestscol, :string
    add_column :users, :neurotb, :string
    add_column :users, :psytb, :string
    add_column :users, :medoc, :string
  end
end
