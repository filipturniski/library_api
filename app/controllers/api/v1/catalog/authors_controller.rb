module Api
  module V1
    module Catalog
      class AuthorsController < ApplicationController
        def search
          authors = BookView.select('name_author', 'author_id').order('name ASC')
          authors = authors.search(params[:authorName]) if params[:authorName].present?
          render json: {status: 'SUCCESS', message: 'Loaded Books', data:authors}, status: :ok
        end

      end
    end
  end
end
