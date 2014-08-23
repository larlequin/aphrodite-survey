json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :gender, :student_group_id, :start, :stop
  json.url user_url(user, format: :json)
end
