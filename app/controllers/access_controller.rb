class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged, :except => [:login,:attempt_login, :logout]

  def menu
    # display text & links
    @username = session[:username]
  end

  def attempt_login

    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first

      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end

    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = 'You\'re now logged in.'
      redirect_to(admin_path)
    else
      flash.now[:notice] = 'Invalid username/password combination.'
      render('login') 
    end

  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'You\'re now deconnected.'
    redirect_to(access_login_path)
  end

  def login
  end

  private

  def confirm_logged
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
      # redirect prevents action from running
    end
  end

end
