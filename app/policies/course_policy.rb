class CoursePolicy < ApplicationPolicy

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
    def resolve
      scope
    end

  end
end
