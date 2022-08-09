module Api
  module V1
    module Management
      class AuthorController < ApplicationController
        def index
          author = Authors.order('name_Author ASC').order('name_author ASC')
          author = author.search(params[:authorName]) if params[:authorName].present?
          render json: { status: 'SUCCESS', message: 'Loaded author', data: author }, status: :ok
        end

        def create
          author = Authors.new(author_params)
          if author.save
            render json: { status: 'SUCCESS', message: 'Author saved', data: author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          author = Authors.find(params[:id])
          if author.update(status_id: 5)
            render json: { status: 'SUCCESS', message: 'Author saved', data: author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          author = Authors.find(params[:id])
          if author.update(params.permit)
            render json: { status: 'SUCCESS', message: 'Author saved', data:author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data:author.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def author_params
          params.permit(:name_author, :status_id)
        end

      end
    end
  end
end
