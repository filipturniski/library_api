module Api
  module V1
    module Management
      class MemberController < ApplicationController
        def index
          member = Member.order('username ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Memebers', data: member }, status: :ok
        end

        def search
          member = Member.order('username ASC')
          member = member.search(params[:user_name])
          render json: { status: 'SUCCESS', message: 'Loaded Memebers', data: member }, status: :ok
        end

        def create
          member = Member.new(member_params)
          if member.save
            render json: { status: 'SUCCESS', message: 'Member saved', data: member }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Member not saved', data: member.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          updateMemberTable(params, 'Deleted Member', 'Not Deleted Member', status_id: 5)
        end

        def update
          updateMemberTable(params, 'Member updated', 'Member not updated', member_params)
        end

        private

        def member_params
          params.permit(:first_name, :last_name, :username, :email, :phone_number)
        end

        def updateMemberTable(params, message, errorMessage, updateValue)#TODO check if there is change
          if params[:id].to_i != 0
            member = Member.where(" id is ? and status_id = 1", params[:id]).update(updateValue)
            ifUpdatedMemberTable(member, message, errorMessage)
          else
            member = Member.where(" name is ? and status_id = 1", params[:id])
            ifUpdatedMemberTable(member, message, errorMessage)
          end
        end

        def ifUpdatedMemberTable(member, message, errorMessage)
          if member.presence
            render json: { status: 'SUCCESS', message: message, data: member }, status: :ok
          else #TODO error hendeling
            render json: { status: 'ERROR', message: errorMessage, data: member },
                   status: :unprocessable_entity
          end
        end

      end
    end
  end
end
