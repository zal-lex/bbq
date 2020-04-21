class EventPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user_owner?
  end

  def edit?
    update?
  end
 
  def destroy?
    update?
  end
 
  private

  def event
    record
  end
 
  def user_owner?
    user.present? && user == event.try(:user)
  end
end
