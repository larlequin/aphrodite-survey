json.array!(@questions) do |question|
  json.extract! question, :id, :type, :name, :group_id, :only_alive_word
  json.url question_url(question, format: :json)
end
