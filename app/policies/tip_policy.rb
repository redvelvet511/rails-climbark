class TipPolicy < ApplicationPolicy
  def create?
    record.users.include?(user)
  end

  class Scope < Scope
    # def resolve
    #   scope.all
    # end
  end
end
