class API::BasePolicy < ApplicationPolicy
  def index?
    binding.pry
    is_admin?
  end

  def show?
    is_admin?
  end

  def create?
    is_admin?
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private

  def is_admin?
    binding.pry
    true
  end
end
