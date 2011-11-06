class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      can :destroy, Member do |m|
        m.user_account != user
      end
    else
      can :read, :all
      can :manage, Staff
      can :update, Member do |m|
        m.user_account == user
      end
    end
  end
end
