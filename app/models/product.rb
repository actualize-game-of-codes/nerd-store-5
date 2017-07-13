class Product < ActiveRecord::Base
  def sale_message
    if price.to_f < 100
      "Discount item!"
    else
      "Everyday value!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def sale_message_class_name
    if sale_message == "Discount item!"
      return "discount-item"
    else
      return ""
    end
  end
end
