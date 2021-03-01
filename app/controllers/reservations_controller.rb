class ReservationsController < ApplicationController
  def index
    @reservations = policy_scope(Reservation).where(user: current_user).order(created_at: :desc)
    #@portfolio = Portfolio.find(user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize(@reservation)
  end

  def create

  end

end
