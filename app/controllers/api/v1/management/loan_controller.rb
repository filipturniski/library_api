module Api
  module V1
    module Management
      class LoanController < ApplicationController
        before_action :checkIfAdmin

        def index
          loan = Loan.active().order('id ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Loans', data: loan }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          params[:updater_id] = params[:user_id_auth]
          availableBooks = BookFreeView.search( params[:book_name], params[:author_id]).first
          if availableBooks.present?
            puts "PROSAO IF"

            if Loan.searchActiveMemeberLoans(params[:user_id]).count <3
              params[:status_id] = 3
              params[:book_id] = availableBooks.book_id
              loan = Loan.new(loan_params_create)
              if loan.save
                render json: { status: 'SUCCESS', message: 'Loan created', data: loan }, status: :created
              else
                render json: { status: 'ERROR', message: 'Loan not created', data: loan.errors },
                       status: :unprocessable_entity
              end
            else
              render json: { status: 'WARNING', message: 'the maximum number of borrowed books has been reached', data: loan },
                     status: :unprocessable_entity
            end

          else
            if Book.searchActiveBookNameAuthor(params[:book_name], params[:author_id]).present?
              render json: { status: 'WARNING', message: 'there is no more book with that name available', data: loan },
                     status: :unprocessable_entity
            else
              render json: { status: 'ERROR', message: 'there is no more book with that name and author', data: loan },
                     status: :unprocessable_entity

            end

          end

        end

        def destroy
          loams = Loan.activeLoans(params[:id]).update({status_id: 5, updater_id: params[:user_id_auth]})
          if loams.empty?
            render json: { status: 'ERROR', message: 'wrong Loan id', data: loams }, status: :unprocessable_entity
          elsif loams
            render json: { status: 'SUCCESS', message: 'Loan destroyed', data: loams }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Loan not destroyed', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          params[:updater_id] = params[:user_id_auth]
          params[:updater_id] = params[:user_id_auth]
          loams = Loan.activeLoans(params[:id]).update(loan_params_update)
          if loams.empty?
            render json: { status: 'ERROR', message: 'wrong Loan id', data: loams }, status: :unprocessable_entity
          elsif loams
            render json: { status: 'SUCCESS', message: 'Loan updated', data: loams }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Loan not updated', data: loams.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def loan_params_create
          params.permit(:user_id, :book_id, :status_id, :creator_id, :updater_id)
        end

        def loan_params_update
          params.permit(:user_id, :book_id, :status_id, :updater_id)
        end

      end
    end
  end
end

