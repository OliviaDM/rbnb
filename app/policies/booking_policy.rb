class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    if @user.id == @record.sucker_id || @user.id == @record.beast.sucker_id
      true
    else
      false
    end
  end

  def create?
    true
  end
end
