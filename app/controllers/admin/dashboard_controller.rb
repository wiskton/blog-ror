class Admin::DashboardController < AdminController

  def index
    @admin = current_admin
    @active = :dashboard
  end

end
