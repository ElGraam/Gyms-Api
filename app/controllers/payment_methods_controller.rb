class PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: [:show]

  # GET /payment_methods
  def index
    @payment_methods = PaymentMethod.all
    render json: @payment_methods.as_json(except: [:created_at, :updated_at])
  end

  # GET /payment_methods/:id
  def show
    render json: @payment_method.as_json(except: [:created_at, :updated_at])
  end

  private

  def set_payment_method
    @payment_method = PaymentMethod.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '支払い方法が見つかりません' }, status: :not_found
  end
end
