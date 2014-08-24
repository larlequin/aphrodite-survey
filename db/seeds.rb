# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'csv'


student_group_file = File.join(Rails.root, "db", "seed_data", "student_group.csv")

CSV.foreach(student_group_file, :headers => true, :encoding => 'UTF-8') do |row|
  row = row.to_hash
  question_group_ids = []
  row['question_groups'].split(",").each do | question_group |
    question_group = QuestionGroup.find_or_create_by(name: question_group)
    question_group_ids.append(question_group.id)
  end
  StudentGroup.create(
    name: row['name'],
    question_group_ids: question_group_ids,
    )
end


question_file = File.join(Rails.root, "db", "seed_data", "question.csv")

CSV.foreach(question_file, :headers => true, :encoding => 'UTF-8') do |row|
  row = row.to_hash
  question_group = QuestionGroup.find_or_create_by(name: row['question_group'])
  Question.create(
    key: row['key'],
    name: row['name'],
    only_not_living: row['only_not_living'],
    group_id: question_group.id,
    )
end


word_file = File.join(Rails.root, "db", "seed_data", "word.csv")

CSV.foreach(word_file, :headers => true, :encoding => 'UTF-8') do |row|
  row = row.to_hash
  question_ids = Question.pluck(:id)
  if row['exclude_question_keys']
    row['exclude_question_keys'].split(",").each do | question_key |
      question = Question.find_by(key: question_key)
      question_ids.delete(question.id)
    end
  end

  Word.create(
    name: row['name'],
    question_ids: question_ids,
    )
end


