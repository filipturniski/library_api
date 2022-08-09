module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = BookView.order('name ASC')
        render json: {status: 'SUCCESS', message: 'Loaded Books', data:books}, status: :ok
      end
      def search
        books = BookView.order('name ASC')
        books = books.search(params[:bookName]) if params[:bookName].present?
        render json: {status: 'SUCCESS', message: 'Loaded Books', data:books}, status: :ok
      end


    end
  end
end