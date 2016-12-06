class AdminUsersController < ApplicationController

  layout 'admin'
  
  before_action :confirm_logged
  before_action :set_edit_properties, :except => [:edit, :update, :delete, :index, :destroy]

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_param)
    if @admin_user.save
      flash[:notice] = "User created"
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_param)
      flash[:notice] = "User #{@admin_user.username} has been modfied."
      redirect_to admin_users_path
    else
      render('edit')
    end
  end

  def delete
    admin_user = AdminUser.find(params[:id])
    admin_user.destroy
    flash[:notice] = "User : #{admin_user.username} has been deleted."
    redirect_to admin_users_path 
  end

  private

  def confirm_logged
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
    end
  end

  def set_edit_properties
    @is_new_username = true
  end

  def admin_user_param
    params.require(:admin_user).permit(:last_name, :first_name, :password, :email, :username)
  end

end
