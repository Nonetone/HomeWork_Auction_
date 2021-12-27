# frozen_string_literal: true

class Description < ApplicationRecord
  validates :price, numericality: true, presence: true
  validates :raise_by, numericality: true, presence: true

  def title
    Product.find(product).title unless product.nil?
  end

  def buyer
    User.find(buyer_id) if !product.nil? && !buyer_id.nil?
  end

  def prod
    Product.find(product) unless product.nil?
  end
end
