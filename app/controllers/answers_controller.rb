class AnswersController < ApplicationController

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def new
    @question = Question.find(session[:current_question_id])
    @word = Word.find(session[:current_word_id])
    @answer = Answer.new(
      user_id: session[:user_id],
      word_id: @word.id,
      question_id: @question.id)

    @rate = (session[:total_word] - session[:word_ids].size - 1) * 100.0 / session[:total_word]
    @timeRemaining = User.find(session[:user_id]).end_of_session - Time.now
    session[:expired] = false
    @timeWarning = false
    if @timeRemaining <= 0
      session[:expired] = true
    elsif @timeRemaining < 600 # 10 minutes
      @timeWarning = true
    end
    session[:answer_create_at] = Time.now
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.word_id = session[:current_word_id]
    @answer.response_time = Time.new - Time.parse(session[:answer_create_at])
    if @answer.save
      if session[:expired]
        reset_session
        redirect_to '/expired'
      elsif session[:question_ids].size != 0
        session[:current_question_id] = session[:question_ids].shift
        redirect_to new_answer_path
      elsif session[:word_ids].size != 0
        word_id = session[:word_ids].shift
        session[:current_word_id] = word_id
        session[:question_ids] = Question.all.ids
        session[:current_question_id] = session[:question_ids].shift
        redirect_to new_answer_path
      else
        user = User.find(session[:user_id])
        user.stop = Time.now
        user.save
        reset_session
        redirect_to '/end'
      end
    else
      render action: 'answers', alert: 'Error'
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:value, :user_id, :question_id, :word_id)
    end
end

