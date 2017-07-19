class Product < ActiveRecord::Base
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
