json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :gender, :td, :start, :stop
  json.url user_url(user, format: :json)
end
