module Conratewebshop
  class PricemanipulatorPolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:name, :order, :code, :perproduct, :showifzero]
    end

    def index?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def show?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def new?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def create?
      new?
    end

    def edit?
      create?
    end

    def update?
      edit?
    end

    def destroy?
      update?
    end
  end
end
