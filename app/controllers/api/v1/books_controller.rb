module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = BookView.order('nameBook ASC')
        render json: {status: 'SUCCESS', message: 'Loaded Books', data:books}, status: :ok
      end
    end
  end
end