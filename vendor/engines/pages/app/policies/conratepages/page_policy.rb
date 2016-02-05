module Conratepages
  class PagePolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:title, :content]
    end

    Scope = Struct.new(:user, :scope) do
      # def resolve
      #   if !user.nil? && (user.has_role?('security-admin') || user.has_role?('conratepages-pagesrole'))
      #     scope.all
      #   else
      #     scope.none
      #   end
      # end

      def listformenu
        scope.all
      end
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

    def listformenu?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end
  end
end
