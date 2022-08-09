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

        private

        def book_params
          params.permit(:name, :location, :status_id, :authors_id)
        end
      end
    end
  end
end
