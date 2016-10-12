class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
    elsif user
      @message = ["Incorrect username/password combination."]
    else
      @message = ["This account does not exist yet. Redirecting to signup..."]
      p @message
      render 'redirect.js.erb'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
