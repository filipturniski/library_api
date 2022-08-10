module Api
  module V1
    module Catalog
      class BookController < ApplicationController

        def index
          books = BookView.select('name', 'name_Author').order('name ASC')
          books = books.search(params[:bookName]) if params[:bookName].present?
          render json: {status: 'SUCCESS', message: 'Loaded Books', data:books}, status: :ok
        end

    end
    end
  end
end