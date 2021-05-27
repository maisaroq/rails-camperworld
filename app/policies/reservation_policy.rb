class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
  # this seems to work ... not sure the record.user == user shouldn't also be in create
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
