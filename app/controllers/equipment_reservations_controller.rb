class EquipmentReservationsController < ApplicationController
  before_action :set_equipment_reservation, only: [:show, :update, :destroy]

  # GET /equipment_reservations
  def index
    @equipment_reservations = EquipmentReservation.all
    render json: @equipment_reservations.as_json(except: [:created_at, :updated_at])
  end

  # GET /equipment_reservations/:id
  def show
    render json: @equipment_reservation.as_json(except: [:created_at, :updated_at])
  end

  # POST /equipment_reservations
  def create
    @equipment_reservation = EquipmentReservation.new(equipment_reservation_params)

    if @equipment_reservation.save
      render json: @equipment_reservation, status: :created, location: @equipment_reservation
    else
      render json: @equipment_reservation.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /equipment_reservations/:id
  def update
    if @equipment_reservation.update(equipment_reservation_params)
      render json: @equipment_reservation
    else
      render json: @equipment_reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipment_reservations/:id
  def destroy
    @equipment_reservation.destroy
    head :no_content
  end

  private

  def set_equipment_reservation
    @equipment_reservation = EquipmentReservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '設備予約が見つかりません' }, status: :not_found
  end

  def equipment_reservation_params
    params.require(:equipment_reservation).permit(:member_id, :equipment_name, :reservation_time)
  end
end