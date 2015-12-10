class Admin::UsersController < AdminController
  before_filter :check_permissions, :only => [:new, :edit, :update, :create, :destroy, :index]
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :create, :users
  end

  def index
    @active = :admin
    @users = Admin.all.page(params[:page]).per(10)
  end

  def create
    @active = :admin
    @user = Admin.new(admins_params)
    #@user.admin_id = current_admin.id
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def show
    @active = :admin
    @user = Admin.find(params[:id])
  end

  def new
    @active = :admin
    @user = Admin.new
  end

  def edit
    @active = :admin
    @user = Admin.find(params[:id])
  end

  def update
    @active = :admin
    @user = Admin.find(params[:id])
    if @user.update_attributes(admins_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    Admin.destroy(params[:id])
    redirect_to admin_users_path
  end

  private
  def admins_params
    params.require(:admin).permit(:name, :password, :admin, :email, :password_confirmation)
  end

end
