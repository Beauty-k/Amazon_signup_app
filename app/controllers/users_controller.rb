class UsersController < ApplicationController
  def index
    
  end
  def new
    @user = User.new
  end

  def create
    puts params.inspect
    @user = User.new(user_params)
    # @user = User.create(user_params)
    # binding.pry
    if @user.save
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def render_profile
    render "layouts/menu"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
