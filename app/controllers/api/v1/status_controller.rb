module Api
  module V1
    class StatusController < ApplicationController
      def index
        status = Status.order('id ASC')
        status = status.search(params[:id]) if params[:id].present?
        render json: {status: 'SUCCESS', message: 'Loaded Status', data:status}, status: :ok
      end
    end
  end
end