class AdminController < ApplicationController
    before_action :authenticate_admin!

    def current_ability
      @current_ability ||= ::Ability.new(current_admin)
    end
end
