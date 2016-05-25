class UsersController < ApplicationController
  before_action :set_user, only: [:edit]

  # GET /users/new
  def new
    @user = User.new
    if session[:user_id]
      redirect_to new_answer_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        redirect_to '/'
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
        :name, :firstname, :age, :email, :gender, :quebeker,
        :yearsquebec, :mothertongue, :languages, :education, :highestscol,
        :question1, :question2, :neurotb, :psytb, :medoc)
    end
end
