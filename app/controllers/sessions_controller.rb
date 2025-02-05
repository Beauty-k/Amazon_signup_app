class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
    #  log_in user
      
      flash[:success] = "you are successfully logged in"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
