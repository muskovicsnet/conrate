module Conratemenus
  class MenuabletypePolicy < Notifications::ApplicationPolicy
    Scope = Struct.new(:user, :scope) do
      def resolve
        if !user.nil? && user.has_role?('conratesecurity_admin')
          scope.all
        else
          scope.none
        end
      end
    end

    def index?
      !user.nil? && user.has_role?('conratesecurity_admin')
    end

    def show?
      false
    end

    def new?
      create?
    end

    def create?
      false
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
