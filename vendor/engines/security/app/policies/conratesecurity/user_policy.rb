module Conratesecurity
  class UserPolicy < ::ApplicationPolicy
    def permitted_attributes
      if @user.has_role?(:conratesecurity_admin)
        [:email, :username, :password, :password_confirmation]
      else
        []
      end
    end

    def index?
      @user.has_role?(:conratesecurity_admin)
    end

    def show?
      @user.has_role?(:conratesecurity_admin)
    end

    def edit?
      @user.has_role?(:conratesecurity_admin)
    end

    def new?
      @user.has_role?(:conratesecurity_admin)
    end

    def create?
      new?
    end

    def update?
      edit?
    end

    def deactivate?
      @user.has_role?(:conratesecurity_admin)
    end

    def destroy?
      @user.has_role?(:conratesecurity_admin)
    end
  end
end
