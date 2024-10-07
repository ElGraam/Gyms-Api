class UsageHistoriesController < ApplicationController
  before_action :set_usage_history, only: [:show, :update, :destroy]

  # GET /usage_histories
  def index
    @usage_histories = UsageHistory.all
    render json: @usage_histories.as_json(except: [:created_at, :updated_at])
  end

  # GET /usage_histories/:id
  def show
    render json: @usage_history.as_json(except: [:created_at, :updated_at])
  end

  # POST /usage_histories
  def create
    if params[:usage_history][:check_out_time] > params[:usage_history][:check_in_time]
      @usage_history = UsageHistory.new(usage_history_params)
      if @usage_history.save
        render json: @usage_history, status: :created, location: @usage_history
      else
        render json: @usage_history.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'チェックアウト時間はチェックイン時間より後でなければなりません。' }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /usage_histories/:id
  def update
    if @usage_history.update(usage_history_params)
      render json: @usage_history
    else
      render json: @usage_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usage_histories/:id
  def destroy
    @usage_history.destroy
    head :no_content
  end

  private

  def set_usage_history
    @usage_history = UsageHistory.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: '利用履歴が見つかりません' }, status: :not_found
  end

  def usage_history_params
    params.require(:usage_history).permit(:member_id, :check_in_time, :check_out_time)
  end
end
