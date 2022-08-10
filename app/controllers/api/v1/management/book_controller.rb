module Api
  module V1
    module Management
      class BookController < ApplicationController
        before_action :checkIfAdmin

        def index
          book = Book.order('name ASC')
          book = book.search(params[:bookName]).order('name ASC') if params[:bookName].present?
          render json: { status: 'SUCCESS', message: 'Loaded Books', data: book }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          book = Book.new(book_params_create)
          if book.save
            render json: { status: 'SUCCESS', message: 'Book saved', data: book }, status: :created
          else
            render json: { status: 'ERROR', message: 'Book not saved', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          book = Book.find(params[:id])
          if book.update({status_id: 5, updater_id: params[:user_id_auth]})
            render json: { status: 'SUCCESS', message: 'Author saved', data: book }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          book = Book.find(params[:id])
          params[:updater_id] = params[:user_id_auth]
          if book.update(book_params_update)
            render json: { status: 'SUCCESS', message: 'Author saved', data:book }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not saved', data:book.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def book_params_create
          params.permit(:name, :location, :status_id, :author_id, :creator_id)
        end

        def book_params_update
          params.permit(:name, :location, :status_id, :author_id, :updater_id)
        end

      end
    end
  end
end
