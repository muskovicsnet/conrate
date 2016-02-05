module Conratesecurity
  class RolePolicy < ::ApplicationPolicy
    def index?
      @user.has_role?(:conratesecurity_admin)
    end

    def show?
      @user.has_role?(:conratesecurity_admin)
    end

    def destroy?
      @user.has_role?(:conratesecurity_admin)
    end
  end
end
