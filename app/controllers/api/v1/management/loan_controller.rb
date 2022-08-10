module Api
  module V1
    module Management
      class LoanController < ApplicationController
        before_action :checkIfAdmin

        def index
          loan = Loan.order('id ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Loans', data: loan }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          availableBooks = BookFreeView.search( params[:book_name], params[:author_id]).first
          if availableBooks.present?
            if Loan.searchActiveMemeberLoans(params[:member_id]).count <3
              params[:status_id] = 3
              loan = Loan.new(loan_params_create)
              if loan.save
                render json: { status: 'SUCCESS', message: 'Loan created', data: loan }, status: :created
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
          if loams.update({status_id: 5, updater_id: params[:user_id_auth]})
            render json: { status: 'SUCCESS', message: 'Author saved', data: loams }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          loams = Loan.find(params[:id])
          params[:updater_id] = params[:user_id_auth]
          if loams.update(loan_params_update)
            render json: { status: 'SUCCESS', message: 'Author saved', data: loams }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def loan_params_create
          params.permit(:user_id, book_id, status_id: creator_id)
        end

        def loan_params_update
          params.permit(:user_id, book_id, status_id: updater_id)
        end

      end
    end
  end
end

