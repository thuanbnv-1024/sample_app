class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:warning] = t".account_invalid"
        redirect_to root_url
      end
    else
      flash[:danger] = t".invalid"
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
