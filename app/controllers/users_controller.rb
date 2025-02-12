class UsersController < ApplicationController
  def index
    
  end
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # binding.pry
    if @user.save
      # flash[:success] = "Account created successfully!"
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def render_profile
    render "layouts/menu"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
