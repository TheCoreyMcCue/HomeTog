class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @reservation = Reservation.find(params[:reservation_id])
    authorize(@review)
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = Reservation.find(params[:reservation_id])
    authorize(@review)
    if @review.save
      redirect_to portfolios_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:photographer_rating, :photographer_description)
  end

end
