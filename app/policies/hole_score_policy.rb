class HoleScorePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
