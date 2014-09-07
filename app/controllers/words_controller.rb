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

  # POST /answers
  # POST /answers.json
#  def create
#    debbuger
#    @word = Word.new(current_word_params)
#
#    respond_to do |format|
#      if @word.save
#        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
#        format.json { render :show, status: :created, location: @answer }
#      else
#        format.html { render :new }
#        format.json { render json: @answer.errors, status: :unprocessable_entity }
#      end
#    end
#  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # TODO
    def word_params
      params.require(:word).permit()
    end
end

