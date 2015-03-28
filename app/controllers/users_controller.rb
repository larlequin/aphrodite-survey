class UsersController < ApplicationController
  before_action :set_user, only: [:edit]

  # GET /users/new
  def new
    @user = User.new
    if session[:user_id]
      redirect_to :controller => 'words', 
        :action => 'answers',
        :id => session[:current_word_id]
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.start = Time.now
    if @user.save
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        group_id = @user.id.modulo(2) + 1
        session[:word_ids] = Word.where(group_id: group_id).pluck(:id).shuffle
        session[:total_word] = session[:word_ids].size
        word_id = session[:word_ids].shift
        session[:current_word_id] = word_id
        redirect_to :controller => 'words', :action => 'answers', :id => word_id
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :age, :gender, :question1, :question2,
        :question3, :question4, :question5)
    end
end
