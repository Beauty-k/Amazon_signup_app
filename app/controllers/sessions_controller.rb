class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
     log_in user
      redirect_to root_path, notice: "you are successfully logged in"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_Out
    redirect_to root_path, notice: "You have logged out successfully"
  end
  private

  def session_params
    params.permit(:email, :password)
  end
end
