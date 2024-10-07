class MembershipPlansController < ApplicationController
  before_action :set_membership_plan, only: [:show]

  # GET /membership_plans
  def index
    @membership_plans = MembershipPlan.all
    render json: @membership_plans.as_json(except: [:created_at, :updated_at])
  end

  # GET /membership_plans/:id
  def show
    render json: @membership_plan.as_json(except: [:created_at, :updated_at])
  end

  private

  def set_membership_plan
    @membership_plan = MembershipPlan.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '会員プランが見つかりません' }, status: :not_found
  end
end
