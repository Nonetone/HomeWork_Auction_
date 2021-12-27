# frozen_string_literal: true

class Product < ApplicationRecord
  validates :price, numericality: true, presence: true
  validates :title, presence: true

  def userr
    #if User.exists?(user)
      User.find(user)
    #else
    #  Product.delete(user)
    #  Review.delete(user)
    #  Description.delete(user)
    #end
  end
   
end
