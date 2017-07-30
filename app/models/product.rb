class Product < ActiveRecord::Base
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :supplier
  # def supplier
  #   return Supplier.find_by(id: supplier_id)
  # end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def discounted?
    price < 100
  end
end
