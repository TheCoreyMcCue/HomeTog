class PortfoliosController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_portfolio, only: %i[show edit update destroy]
  def index
    # @portfolios = Portfolio.all
    @portfolios = policy_scope(Portfolio).order(created_at: :desc)
    # if params.dig(:search, :location).present?
    #   @portfolios = @portfolios.where(location: params.dig(:search, :location))
    # else
    #   @portfolios = @portfolios.all
    # end
    # @markers = @portfolios.geocoded.map do |portfolio|
    # {
    #   lat: portfolio.latitude,
    #   lng: portfolio.longitude
    # }
    @favorite = Favorite.new
  end

  def show
    @reservations = Reservation.new
    @portfolio = Portfolio.find(params[:id])
    authorize(@portfolio)
    @favorite = Favorite.new
  end

  def new
    @portfolio = Portfolio.new
    authorize(@portfolio)
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @user = current_user
    @portfolio.user = @user
    @portfolio.save
    redirect_to portfolio_path(@portfolio)
    authorize @portfolio
  end

  def edit
    authorize(@portfolio)
  end

  def update
    authorize(@portfolio)
    @portfolio.update(portfolio_params)
    redirect_to portfolio_path(@portfolio)
  end

  def destroy
    authorize(@portfolio)
    @portfolio.destroy
    redirect_to portfolios_url
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :location, :description, :price, photos: [])
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
