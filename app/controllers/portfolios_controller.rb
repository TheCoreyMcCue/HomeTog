class PortfoliosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_portfolio, only: %i[show edit update destroy]
  def index
    # @portfolios = Portfolio.all
    @portfolios = policy_scope(Portfolio).order(created_at: :desc)
 if params[:query].present?
      sql_query = " \
        portfolios.name @@ :query \
        OR portfolios.location @@ :query \
      "
      @portfolios = Portfolio.joins(:location).where(sql_query, query: "%#{params[:query]}%")
    else
      @portfolios = Portfolio.all
    end
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
      authorize @portfolio
      if @portfolio.save
        redirect_to portfolio_path(@portfolio)
      else
        redirect_to reservations_path, notice: "You are a Photographer already! (You can only upload one portfolio)"
      end
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
