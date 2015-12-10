class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_categories

  protect_from_forgery with: :exception

  def load_categories
    @categories = Category.order('name')
    @users = Admin.order('name')
  end

  def index
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
