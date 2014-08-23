json.array!(@question_groups) do |question_group|
  json.extract! question_group, :id, :name, :student_group_id
  json.url question_group_url(question_group, format: :json)
end
