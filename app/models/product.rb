class Product < ActiveRecord::Base
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
