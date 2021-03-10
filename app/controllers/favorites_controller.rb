class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @favorite.portfolio = @portfolio
    authorize(@favorite)
    @favorite.save
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js {}
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize(@favorite)
    @portfolio = @favorite.portfolio
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js {}
    end
  end
end
