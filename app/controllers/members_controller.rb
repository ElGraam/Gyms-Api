class MembersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]

    before_action :set_member, only: [:show, :update, :destroy]

    # GET /members
    def index
        @members = Member.all
        render json: {members:@members.as_json(except: [:password_digest])}
    end

    # GET /members/:id
    def show
        render json: @member.as_json(except: [:password_digest])
    end

    # POST /members
    def create
        if params[:member][:password] != params[:member][:password_confirmation]
            render json: { error: 'パスワードが一致しません' }, status: :unprocessable_entity
            return
        end            
        @member = Member.new(member_params)
        @member.join_date = Date.today

        if @member.save
            render json: @member, status: :created, location: @member
        else
            render json: @member.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /members/:id
    def update
        if @member.update(member_params)
            render json: @member
        else
            render json: @member.errors, status: :unprocessable_entity
        end
    end

    # DELETE /members/:id
    def destroy
        @member.destroy
        head :no_content
    end

    private

    def set_member
        @member = Member.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'メンバーが見つかりません' }, status: :not_found
    end

    def member_params
        params.require(:member).permit(
            :first_name,
            :last_name,
            :username,
            :email,
            :phone_number,
            :membership_plan_id,
            :membership_status_id,
            :password,
            :password_confirmation
        )
    end
end
