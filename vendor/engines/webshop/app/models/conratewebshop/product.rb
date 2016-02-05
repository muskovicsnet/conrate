module Conratewebshop
  class Product < ActiveRecord::Base
    mount_uploader :picture, PictureUploader

    belongs_to :category
    has_many :line_items
    has_many :orders, through: :line_items
    belongs_to :quantity_unit
    belongs_to :unitprice_quantity_unit, class_name: "QuantityUnit"

    before_destroy :ensure_not_referenced_by_any_line_item

    validates :name, presence: true

    private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
  end
end
