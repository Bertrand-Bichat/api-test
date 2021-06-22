class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user_loggedin?
  end

  def update?
    record.user == user if user_loggedin?
  end

  def destroy?
    record.user == user if user_loggedin?
  end
end
