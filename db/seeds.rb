# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'


question_file = File.join(Rails.root, "db", "seed_data", "question.csv")

CSV.foreach(question_file, :headers => true, :encoding => 'UTF-8') do |row|
  row = row.to_hash
  Question.create(
    name: row['name'],
    )
end


word_file = File.join(Rails.root, "db", "seed_data", "word.test.csv") # Remove test during production

CSV.foreach(word_file, :headers => true, :encoding => 'UTF-8') do |row|
  row = row.to_hash
  Word.create(
    name: row['name'],
    group_id: row['group_id'],
    )
end


