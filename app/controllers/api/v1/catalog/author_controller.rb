module Api
  module V1
    module Catalog
      class AuthorController < ActionController::API

        def index
          authors = BookView.distinct.order('name ASC')
          authors = authors.search(params[:authorName]) if params[:authorName].present?
          render json: {status: 'SUCCESS', message: 'Loaded Author', data:authors}, status: :ok
        end

      end
    end
  end
end
