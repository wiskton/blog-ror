class PostsController < ApplicationController

  def home
    @active = :home
    @posts = Post.order('datetime DESC').page(params[:page]).per(10)
  end

  def category
    # @category = Category.page(params[:page]).per(10).includes(:posts).find_by_slug(params[:slug])
    # @posts = @category.posts #.where('category_id = ?', @category.id)
      @category = Category.find_by_slug(params[:slug])
      @active = @category.slug
      @posts = Post.where('category_id = ?', @category.id).page(params[:page]).per(10)
  end

  def writer
    @admin = Admin.find_by_slug(params[:slug])
    @posts = Post.where('admin_id = ?', @admin.id).page(params[:page]).per(10)
  end

  def detail
    @post = Post.friendly.find(params[:slug])
  end
end
