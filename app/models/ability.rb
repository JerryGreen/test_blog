class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    case user.role
    when 'admin'
        can :manage, :all
    when 'manager'
        can [:create, :read], Project
        can [:update, :destroy], Project, :user_id => user.id
        can [:read], User
        can [:update], User, :id => user.id
    when 'client'
        can [:read], Project
        can [:read], User
        can [:update], User, :id => user.id
    end
  end
end
