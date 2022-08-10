module Api
  module V1
    module Management
      class BookController < ApplicationController
        before_action :checkIfAdmin

        def index
          book = Book.active().order('name ASC')
          book = book.search(params[:bookName]).order('name ASC') if params[:bookName].present?
          render json: { status: 'SUCCESS', message: 'Loaded Books', data: book }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          params[:updater_id] = params[:user_id_auth]
          book = Book.new(book_params_create)
          if book.save
            render json: { status: 'SUCCESS', message: 'Book saved', data: book }, status: :created
          else
            render json: { status: 'ERROR', message: 'Book not saved', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          book = Book.searchActiveBookId(params[:id]).update({status_id: 5, updater_id: params[:user_id_auth]})
          if book.empty?
            render json: { status: 'ERROR', message: 'Wrong Book Id', data:book }, status: :unprocessable_entity
          elsif book
            render json: { status: 'SUCCESS', message: 'Book destroyed', data: book }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Book not destroyed', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          params[:updater_id] = params[:user_id_auth]
          book = Book.searchActiveBookId(params[:id]).update(book_params_update)
          if book.empty?
            render json: { status: 'ERROR', message: 'Wrong Book Id', data:book }, status: :unprocessable_entity
          elsif book
            render json: { status: 'SUCCESS', message: 'Book updated', data:book }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Book not updated', data:book.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def book_params_create
          params.permit(:name, :location, :status_id, :author_id, :creator_id, :updater_id)
        end

        def book_params_update
          params.permit(:name, :location, :status_id, :author_id, :updater_id)
        end

      end
    end
  end
end
