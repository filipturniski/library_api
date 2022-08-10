module Api
  module V1
    module Management
      class UserController < ApplicationController
        before_action :checkIfAdmin

        def index
          user = User.active().order('username ASC')
          user = user.search(params[:user_name]) if params[:user_name].present?
          render json: { status: 'SUCCESS', message: 'Loaded Memebers', data: user }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          params[:updater_id] = params[:user_id_auth]
          user = User.new(user_params_create)
          if user.save
            render json: { status: 'SUCCESS', message: 'User saved', data: user }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'User not saved', data: user.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          user = User.searchActiveMemeberId(params[:id]).update({status_id: 5, updater_id: params[:user_id_auth]})
          if user.empty?
            render json: { status: 'ERROR', message: 'wrong User id', data: user }, status: :unprocessable_entity
          elsif user
            render json: { status: 'SUCCESS', message: 'User destroyed', data: user }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'User not destroyed', data: user.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          params[:updater_id] = params[:user_id_auth]
          user = User.searchActiveMemeberId(params[:id])

          if user.empty?
            render json: { status: 'ERROR', message: 'wrong User id', data: user }, status: :unprocessable_entity
          elsif user
            render json: { status: 'SUCCESS', message: 'Author updated', data: user }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not updated', data: user.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def user_params_create
          params.permit(:first_name, :last_name, :username, :email, :phone_number, :creator_id, :creator_id, :updater_id)
        end

        def user_params_update
          params.permit(:first_name, :last_name, :username, :email, :phone_number, :creator_id, :updater_id)
        end

      end
    end
  end
end
