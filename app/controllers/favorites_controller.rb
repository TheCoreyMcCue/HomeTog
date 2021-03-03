class FavoritesController < ApplicationController


  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.portfolio = Portfolio.find(params[:portfolio_id])
    authorize(@favorite)
    @favorite.save
    redirect_to portfolios_path

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize(@favorite)
    @favorite.destroy
    redirect_to portfolios_path
  end
end
