class Admin::CategoriesController < AdminController
  before_filter :check_permissions, :only => [:edit, :update, :destroy]
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :edit, :users
  end

  def index
    @active = :category
  	#@categories = Category.all
    @categories = Category.order('id DESC').page(params[:page]).per(10)
  end

  def create
    @active = :category
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def show
    @active = :category
    @category = Category.find(params[:id])
  end

  def new
    @active = :category
    @category = Category.new
  end

  def edit
    @active = :category
    @category = Category.find(params[:id])
    #@category.date = @category.date.strftime("%d/%m/%Y")
    #@category.time1 = @category.time1.strftime("%H:%M:%S")
  end

  def update
    @active = :category
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
