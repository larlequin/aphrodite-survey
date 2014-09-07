class WordsController < ApplicationController
  before_action :set_word, only: [:show, :answer]

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def answers
    @word = Word.find(params[:id])
    @questions = []
    @word.questions.each do | question |
      if question.group_id == session[:current_question_group_id]
        @questions.append(question)
      end
    end
  end

  def update
    word_params.each do | id, value |
        answer = Answer.new(
            user_id: session[:user_id],
            question_id: id,
            value: value["answers"]["value"],
        )
        answer.save
    end
    
    word_id = session[:word_ids].shift
    redirect_to :controller => 'words', :action => 'answers', :id => word_id

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

