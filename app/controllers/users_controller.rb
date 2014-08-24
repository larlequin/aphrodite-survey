class UsersController < ApplicationController
  before_action :set_user, only: [:edit]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        session[:word_ids] = Word.pluck(:id).shuffle
        word_id = session[:word_ids].shift
        redirect_to :controller => 'words', :action => 'show', :id => word_id
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
      params.require(:user).permit(:name, :age, :gender, :student_group_id)
    end
end
