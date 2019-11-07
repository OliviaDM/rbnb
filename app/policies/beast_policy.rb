class BeastPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    if @user.id == @record.sucker_id
      true
    else
      false
    end
  end
end
