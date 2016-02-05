module Conratewebshop
  class ProductPolicy < Notifications::ApplicationPolicy
    def permitted_attributes
      [:name, :description, :price, :picture, :picture_cache, :category_id, :quantity_unit_id, :quantity, :unitprice, :unitprice_quantity_unit_id]
    end

    # def index?
    #   !@user.nil?
    # end

    # def show?
    #   true
    # end

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
