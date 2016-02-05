# module Conratesettings
  class SettingsPolicy < ::ApplicationPolicy
    def permitted_attributes
      []
    end

    def index?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def show?
      index?
    end

    def new?
      create?
    end

    def create?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
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
# end
