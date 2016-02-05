module Conrateblogs
  class PostPolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:title, :content, :blog_id]
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
  end
end
