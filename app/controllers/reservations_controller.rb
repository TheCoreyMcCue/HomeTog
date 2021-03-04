class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation).where(user: current_user).order(created_at: :desc)
    @requests = Reservation.joins(:portfolio).where(portfolio: { user: current_user })
    @portfolio = current_user.portfolio
    @favorites = current_user.favorites
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)
  end

  def create
    @user = current_user
    @portfolio = Portfolio.find(params[:portfolio_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user
    @reservation.portfolio = @portfolio
    authorize(@reservation)
    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "Reservation was saved succsessfully!"
    else
      redirect_to portfolio_path(@portfolio), notice: "Could not create Reservation!"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)
    @reservation.destroy
    redirect_to reservations_path, notice: "Reservation was cancelled succsesfully!"
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)

    if params[:approve] == "true"
      @reservation.approved = true
      @reservation.declined = false
    else
      @reservation.declined = true
      @reservation.approved = false
    end
    @reservation.save
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :portfolio_id, :date, :total_price, :approved)
  end
end
