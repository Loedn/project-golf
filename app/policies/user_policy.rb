class UserPolicy < ApplicationPolicy

  def create?
    return true
  end

  def edit?
    record.owner == user
  end

  def update?
    edit?
  end

  def destroy?
    record.owner == user

  end


  class Scope < Scope
    attr_reader :user, :Scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

  end
end
