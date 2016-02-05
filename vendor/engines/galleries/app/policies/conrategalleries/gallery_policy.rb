module Conrategalleries
  class GalleryPolicy < ::ApplicationPolicy
    attr_reader :user, :gallery

    def initialize(user, gallery)
      @user = user
      @gallery = gallery
    end

    def permitted_attributes
      [:title, :description, :socials]
    end

    Scope = Struct.new(:user, :scope) do
      def resolve
        if !@user.nil? && @user.has_role?(:conratesecurity_admin)
          scope.all
        else
          scope.none
        end
      end

      def listformenu
        scope.all
      end
    end

    def index?
      false
    end

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
      update?
    end

    def update?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def destroy?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def listformenu?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def save_order?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end
  end
end
