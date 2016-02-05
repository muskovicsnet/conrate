module Conratemenus
  class MenuPolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:title, :menuable_id, :menuable_type]
    end

    # def index?
    #   !@user.nil?
    # end

    def show?
      true
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

    def manage
      
    end
  end
end
