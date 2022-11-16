class ApplicationController < ActionController::Base
	include Passwordless::ControllerHelpers # <-- This!

  helper_method :current_user
  
  def create
    @user = User.new user_params

    if @user.save
      sign_in @user
      redirect_to @user, flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to root_path, flash: { error: 'You are not worthy!' }
  end
end
