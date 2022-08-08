module Api
  module V1
    class StatusController < ApplicationController
      def index
        status = Status.order('idStatus ASC')
        render json: {status: 'SUCCESS', message: 'Loaded Status', data:status}, status: :ok
      end

      def show
        status = Status.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Status', data:status}, status: :ok
      end
    end
  end
end