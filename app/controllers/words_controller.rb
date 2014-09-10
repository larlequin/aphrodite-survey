class WordsController < ApplicationController
  before_action :set_word, only: [:show, :answer]

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def answers
    @word = Word.find(params[:id])
    @questions = []

    session[:question_group_ids].each do | group_id |
      @word.questions.each do | question |
        if question.group_id == group_id
          @questions.append(question)
        end
      end
    end
  end

  def update
    word_params.each do | id, value |
        answer = Answer.new(
            word_id: params[:id],
            user_id: session[:user_id],
            question_id: id,
            value: value["answers"]["value"],
        )
        answer.save
    end
    if session[:word_ids].size == 0
      user = User.find(session[:user_id])
      user.stop = Time.now
      user.save
      reset_session
      redirect_to '/end'
    else
      word_id = session[:word_ids].shift
      session[:current_word_id] = word_id
      redirect_to :controller => 'words', :action => 'answers', :id => word_id
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # TODO
    def word_params
      params.require(:word) # TODO FIXME.permit("question_1", "question_2", "question_3")
    end
end

