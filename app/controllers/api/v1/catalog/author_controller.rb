module Api
  module V1
    module Catalog
      class AuthorController < ApplicationController

        def index
          authors = BookView.select('name_author', 'author_id').distinct.order('name ASC')
          authors = authors.search(params[:authorName]) if params[:authorName].present?
          render json: {status: 'SUCCESS', message: 'Loaded Books', data:authors}, status: :ok
        end

      end
    end
  end
end
