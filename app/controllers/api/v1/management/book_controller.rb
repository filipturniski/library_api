module Api
  module V1
    module Management
      class BookController < ApplicationController
        def index
          book = Book.order('name ASC')
          book = book.search(params[:bookName]).order('name ASC') if params[:bookName].present?
          render json: { status: 'SUCCESS', message: 'Loaded Books', data: book }, status: :ok
        end

        def create
          book = Book.new(book_params)
          if book.save
            render json: { status: 'SUCCESS', message: 'Book saved', data: book }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Book not saved', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          book = Book.find(params[:id])
          if book.update(status_id: 5)
            render json: { status: 'SUCCESS', message: 'Author saved', data: book }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: book.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          book = Book.find(params[:id])
          if book.update(params.permit)
            render json: { status: 'SUCCESS', message: 'Author saved', data:book }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data:book.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def book_params
          params.permit(:name, :location, :status_id, :author_id)
        end

      end
    end
  end
end
