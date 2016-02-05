module Conratewebshop
  class OrderPolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:name, :address, :pay_type, :terms_of_service, :billingisdelivery]
    end

    def index?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    def show?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end

    #def new?
    #  !@user.nil?
    #end

    # def create?
    #   !@user.nil? && @user.has_role?(:conratesecurity_admin)
    # end

    # def edit?
    #   create?
    # end

    # def update?
    #   edit?
    # end

    # def destroy?
    #   update?
    # end

    def order?
      !@user.nil? && @user.has_role?(:conratesecurity_admin)
    end
  end
end
