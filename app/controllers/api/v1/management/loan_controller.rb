module Api
  module V1
    module Management
      class LoanController < ApplicationController
        def index
          loan = Loan.order('id ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Loans', data: loan }, status: :ok
        end

        def create
          availableBooks = BookFreeView.search( params[:book_name], params[:author_id]).first
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
          loams = Loan.find(params[:id])
          if loams.update(status_id: 5)
            render json: { status: 'SUCCESS', message: 'Author saved', data: loams }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          loams = Loan.find(params[:id])
          if loams.update(loan_params)
            render json: { status: 'SUCCESS', message: 'Author saved', data: loams }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def loan_params
          params.permit(:status_id)
        end

      end
    end
  end
end

