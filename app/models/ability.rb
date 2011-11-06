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
      can :update, Member, user_account: user
      can :update, UserAccount, id: user.id
      user.member? ? can(:manage, Staff) : can(:manage, [Staff, Event, Stage])
    end
  end
end
