class AccessController < ApplicationController

  layout 'public'

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(envelopes_path)
    else
      flash.now[:notice] = "Ivalid username/password combination."
      render('login')
    end
  end

  def logout
    reset_session
    flash[:notice] = "Logged Out"
    redirect_to(login_path)
  end
end
