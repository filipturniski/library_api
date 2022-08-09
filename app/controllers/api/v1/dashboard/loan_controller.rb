module Api
  module V1
    module Dashboard
      class LoansController < ApplicationController

        def search

          memberLoans = Loan.search(params[:member_id]).order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Loaded user loan data', data: memberLoans }, status: :ok
        end

      end
    end
  end
end