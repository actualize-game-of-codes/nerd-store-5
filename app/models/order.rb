class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def calculate_subtotal_tax_and_total
    calculated_subtotal = quantity * product.price
    calculated_tax = quantity * product.tax
    calculated_total = calculated_subtotal + calculated_tax
    update(subtotal: calculated_subtotal, tax: calculated_tax, total: calculated_total)
  end
end
