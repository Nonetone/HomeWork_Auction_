class ProductController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user.id
    @product.description = false
    @product.save
    redirect_to my_goods_path
  end

  private def product_params
    params.require(:product).permit(:title, :text, :price)
  end
end
