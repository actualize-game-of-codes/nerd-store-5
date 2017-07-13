class Product < ActiveRecord::Base
  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def discounted?
    price.to_f < 100
  end
end
