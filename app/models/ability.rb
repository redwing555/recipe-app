# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food, public: true
    can :read, Recipe, public: true

    return unless user.present?

    can :manage, Food, user: user
    can :manage, Recipe, user:user
    can :create, :all
  end
end
