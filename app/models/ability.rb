class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Admin.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can [:read, :create], Category
      # can [:read, :create], Category
      can [:read, :update, :create], Post
    end
  end

end
