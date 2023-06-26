class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.permit(:check_in_date, :check_out_date, :number_of_people))
    @reservation.user_id = current_user.id
    @reservation.room_id = params[:id]
    if @reservation.save
      flash[:notice] = "予約しました"
      redirect_to :reservations
    else
      flash[:alert] = "予約できませんでした"
      redirect_to template: "rooms/show"
    end
  end

  def show
    @reservation = Reservation.all
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to :reservations
  end
end
