class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    member = Member.find_by(email: session_params[:email])
    if member&.authenticate(session_params[:password])
      token = JsonWebToken.encode(member_id: member.id)
      render json: { message: "ログイン成功", token: token }, status: :ok
    else
      render json: { error: "認証に失敗しました" }, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
