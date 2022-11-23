class LinePolicy < ApplicationPolicy
  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
