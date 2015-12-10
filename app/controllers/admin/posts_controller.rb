class Admin::PostsController < AdminController
  before_filter :check_permissions, :only => [:destroy]
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :destroy, :users
  end

  def index
    @active = :post
    @posts = Post.all.page(params[:page]).per(10).order('id DESC')
  end

  def create
    @active = :post
    @post = Post.new(posts_params)
    @post.admin_id = current_admin.id
    if @post.save
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def show
    @active = :post
    @post = Post.find(params[:id])
  end

  def new
    @active = :post
    @post = Post.new
  end

  def edit
    @active = :post
    @post = Post.find(params[:id])
  end

  def update
    @active = :post
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to admin_posts_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :datetime, :content, :category_id)
  end

end
