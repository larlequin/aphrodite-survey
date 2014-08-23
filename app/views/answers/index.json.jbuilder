json.array!(@answers) do |answer|
  json.extract! answer, :id, :user_id, :word_id, :question_id, :value
  json.url answer_url(answer, format: :json)
end
