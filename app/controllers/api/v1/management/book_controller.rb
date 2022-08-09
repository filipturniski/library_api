# frozen_string_literal: true

module Api
  module V1
    module Management
      class BookController < ApplicationController
        def index
          book = BookFreeView.select('name', 'name_author', 'numberOfCopies').order('name ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Books', data: book }, status: :ok
        end

        def search
          book = BookFreeView.select('name', 'name_author', 'numberOfCopies').order('name ASC')
          book = book.search(params[:bookName]) if params[:bookName].present?
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
          updateBookTable(params, 'Deleted Book', 'Not Deleted Book', status_id: 4)
        end

        def update
          updateBookTable(params, 'Book updated', 'Book not updated', book_params)
        end

        private

        def book_params
          params.permit(:name, :location, :status_id, :authors_id)
        end

        def updateBookTable(params, message, errorMessage, updateValue)
          if params[:id].to_i != 0
            book = Book.where(" id is ?", params[:id]).update(updateValue)
            ifUpdatedBookTable(book, message, errorMessage)
          else
            book = Book.where(" name is ?", params[:id])
            ifUpdatedBookTable(book, message, errorMessage)
          end
        end

        def ifUpdatedBookTable(book, message, errorMessage)
          if book.presence
            render json: { status: 'SUCCESS', message: message, data: book }, status: :ok
          else #TODO error hendeling
            render json: { status: 'ERROR', message: errorMessage, data: book },
                   status: :unprocessable_entity
          end
        end

      end
    end
  end
end
