class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    if header
      header = header.split(' ').last
      begin
        @decoded = JsonWebToken.decode(header)
        @current_member = Member.find(@decoded[:member_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: '指定されたメンバーは存在しません' }, status: :unauthorized
      rescue JWT::ExpiredSignature
        render json: { error: 'トークンの有効期限が切れています' }, status: :unauthorized
      rescue JWT::DecodeError
        render json: { error: '無効なトークンです' }, status: :unauthorized
      end
    else
      render json: { error: 'Authorizationヘッダーが見つかりません' }, status: :unauthorized
    end
  end
end
