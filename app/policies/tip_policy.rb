class TipPolicy < ApplicationPolicy
  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
