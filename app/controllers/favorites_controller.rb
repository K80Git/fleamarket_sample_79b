class FavoritesController < ApplicationController
  before_action :set_product, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @favorites = Favorite.all.page(params[:page]).per(18).where(user_id: current_user.id).order('created_at DESC')
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id, 
      product_id: @product.id
    )
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id, 
      product_id: @product.id
    )
    @favorite.destroy
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

end
