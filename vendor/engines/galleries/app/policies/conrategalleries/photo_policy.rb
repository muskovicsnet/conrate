module Conrategalleries
  class PhotoPolicy < ::ApplicationPolicy
    attr_reader :user, :photo

    def initialize(user, photo)
      @user = user
      @photo = photo
    end

    def permitted_attributes
      [:title, :file]
    end

    Scope = Struct.new(:user, :scope) do
      def resolve
        if !user.nil? && user.has_role?(:conratesecurity_admin)
          scope.all
        else
          scope.none
        end
      end
    end

    def index?
      !user.nil? && user.has_role?(:conratesecurity_admin)
    end

    def show?
      true
    end

    def new?
      create?
    end

    def create?
      !user.nil? && user.has_role?(:conratesecurity_admin)
    end

    def edit?
      update?
    end

    def update?
      !user.nil? && user.has_role?(:conratesecurity_admin)
    end

    def destroy?
      !user.nil? && user.has_role?(:conratesecurity_admin)
    end

    def listformenu?
      !user.nil? && user.has_role?(:conratesecurity_admin)
    end
  end
end
