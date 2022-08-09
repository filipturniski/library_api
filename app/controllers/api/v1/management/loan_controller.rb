module Api
  module V1
    module Management
      class LoanController < ApplicationController
        def index
          loan = Loan.order('id ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Loans', data: loan }, status: :ok
        end

        def create
          availableBooks = BookFreeView.search( params[:book_name]).first
          if availableBooks.present?
            if Loan.searchActiveMemeberLoans(params[:member_id]).count <3
              loan = Loan.new({"member_id": 1, "book_id": availableBooks.book_id, "status_id": 3})
              if loan.save
                render json: { status: 'SUCCESS', message: 'Loan created', data: loan }, status: :ok
              else
                render json: { status: 'ERROR', message: 'Loan not created', data: loan.errors },
                       status: :unprocessable_entity
              end
            else
              render json: { status: 'ERROR', message: 'the maximum number of borrowed books has been reached', data: loan },
                     status: :unprocessable_entity
            end

          else
            render json: { status: 'ERROR', message: 'there is no more book with that name available', data: loan },
                   status: :unprocessable_entity
          end

        end

        def destroy
          updateLoanTable(params, 'Deleted Loan', 'Not Deleted Loan', status_id: 5)
        end

        def update
          updateLoanTable(params, 'Loan updated', 'Loan not updated', loan_params)
        end

        private

        def loan_params
          params.permit(:status_id)
        end

        def updateLoanTable(params, message, errorMessage,updateValue) #TODO check if there is change
          loan = Loan.find(params[:id]).update(updateValue)
          if loan.presence
            render json: { status: 'SUCCESS', message: message, data: loan }, status: :ok
          else #TODO error hendeling
            render json: { status: 'ERROR', message: errorMessage, data: loan },
                   status: :unprocessable_entity
          end
        end

      end
    end
  end
end

