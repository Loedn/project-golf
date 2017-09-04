class UserPolicy < ApplicationPolicy

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    edit?
  end

  def destroy?
    record.owner == user
  end


  def dashboard?
    return true
  end

  def index?
    true
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
