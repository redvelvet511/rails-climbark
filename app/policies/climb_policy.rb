class ClimbPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    true
  end

  def show?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end
end
