module Api
  module V1
    module Management
      class MemberController < ApplicationController
        def index
          member = User.order('username ASC')
          member = member.search(params[:user_name]) if params[:user_name].present?
          render json: { status: 'SUCCESS', message: 'Loaded Memebers', data: member }, status: :ok
        end

        def create
          member = User.new(member_params)
          if member.save
            render json: { status: 'SUCCESS', message: 'User saved', data: member }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'User not saved', data: member.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          member = User.find(params[:id])
          if member.update(status_id: 5)
            render json: { status: 'SUCCESS', message: 'Author saved', data: member }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: member.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          member = User.find(params[:id])
          if member.update(member_params)
            render json: { status: 'SUCCESS', message: 'Author saved', data: member }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: member.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def member_params
          params.permit(:first_name, :last_name, :username, :email, :phone_number)
        end

      end
    end
  end
end
