class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.guest?

    if user.admin?
      can :manage, :all
      return
    end

    if user.editor?
      can :create, Image
      can [:create, :show], Upload
      can [:destroy, :update], [Image, Upload], user_id: user.id
      can :manage, [Club, Tournament]
    end

    if user.calendar? || user.editor?
      can :create, Event
      can [:destroy, :update], Event, user_id: user.id
    end

    if user.membership?
      can :create, CashPayment
      can :manage, Player
    end

    if user.translator?
      can :manage, Translation
      can :show, JournalEntry, journalable_type: "Translation"
    end

    if user.treasurer?
      can :create, CashPayment
      can :index, [Item, PaymentError, Refund]
      can :manage, [Cart, Fee, UserInput]
    end

    can :manage_preferences, User, id: user.id
    can :show, Player, id: user.player_id
  end
end
