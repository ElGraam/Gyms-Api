class PaymentsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  before_action :set_payment, only: [:show, :update, :destroy]

  # GET /payments
  def index
    @payments = Payment.all.as_json(except: [:created_at, :updated_at])
    render json: @payments
  end

  # GET /payments/:id
  def show
    render json: @payment.as_json(except: [:created_at, :updated_at])
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: @payment, status: :created, location: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /payments/:id
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payments/:id
  def destroy
    @payment.destroy
    head :no_content
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '支払いが見つかりません' }, status: :not_found
  end

  def payment_params
    params.require(:payment).permit(:member_id, :amount, :payment_date, :payment_method_id, :membership_plan_id)
  end
end
