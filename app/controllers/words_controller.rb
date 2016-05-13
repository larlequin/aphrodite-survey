class WordsController < ApplicationController
  before_action :set_word, only: [:show, :answer]

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def set_variable
    @word = Word.find(params[:id])
    @rate = (session[:total_word] - session[:word_ids].size - 1) * 100.0 / session[:total_word]
    @timeRemaining = User.find(session[:user_id]).end_of_session - Time.now
    session[:expired] = false
    @timeWarning = false
    if @timeRemaining <= 0
      session[:expired] = true
    elsif @timeRemaining < 600 # 10 minutes
      @timeWarning = true
    end
    @questions = []
    Question.all.each do | question |
      @questions << question
    end
    first = @questions.shift
    @questions = @questions.rotate((session[:user_id]/4).modulo(5))
    @questions.unshift(first)
  end

  def answers
    set_variable
   end

  def update
    set_variable
    word_params["answers_attributes"].each do | key, val |
      unless word_params["answers_attributes"][key]["value"]
        @error = true
        return render action: 'answers', alert: 'Error'
      end
    end
    if @word.update(word_params)
      if session[:word_ids].size == 0 or session[:expired]
        puts "ending"
        user = User.find(session[:user_id])
        user.stop = Time.now
        user.save
        reset_session
        redirect_to '/end'
      else
        puts "okokok"
        word_id = session[:word_ids].shift
        session[:current_word_id] = word_id
        redirect_to :controller => 'words', :action => 'answers', :id => word_id
      end
    else
      render action: 'answers', alert: 'Error'
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
      params.require(:word).permit(:word, :answers_attributes=>[:user_id, :question_id, :value])
    end
end

