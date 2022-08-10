module Api
  module V1
    module Dashboard
      class LoanController < ApplicationController
        def index
          memberLoans = Loan.search(params[:user_id_auth]).order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Loaded user loan data', data: memberLoans }, status: :ok
        end

      end
    end
  end
end