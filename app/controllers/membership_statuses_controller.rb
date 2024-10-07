class MembershipStatusesController < ApplicationController
  before_action :set_membership_status, only: [:show]

  # GET /membership_statuses
  def index
    @membership_statuses = MembershipStatus.all
    render json: @membership_statuses.as_json(except: [:created_at, :updated_at])
  end

  # GET /membership_statuses/:id
  def show
    render json: @membership_status.as_json(except: [:created_at, :updated_at])
  end

  private

  def set_membership_status
    @membership_status = MembershipStatus.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '会員ステータスが見つかりません' }, status: :not_found
  end
end
