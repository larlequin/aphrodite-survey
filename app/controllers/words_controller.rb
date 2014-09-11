class WordsController < ApplicationController
  before_action :set_word, only: [:show, :answer]

  # GET /words/1
  # GET /words/1.json
  def show
  end

  def answers
    @word = Word.find(params[:id])
  end

  def update
      @word = Word.find(params[:id])
      if @word.update(word_params)
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
      else
        render action: 'answers', notice: 'Perfect!'
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

