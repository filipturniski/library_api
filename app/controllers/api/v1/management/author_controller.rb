module Api
  module V1
    module Management
      class AuthorController < ApplicationController
        before_action :checkIfAdmin
        def index
          author = Author.order('name_Author ASC').order('name_author ASC')
          author = author.search(params[:authorName]) if params[:authorName].present?
          render json: { status: 'SUCCESS', message: 'Loaded author', data: author }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id]
          author = Author.new(author_params_create)
          if author.save
            render json: { status: 'SUCCESS', message: 'Author saved', data: author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          author = Author.find(params[:id])
          if author.update({status_id: 5, updater_id: params[:user_id]})
            render json: { status: 'SUCCESS', message: 'Author saved', data: author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          author = Author.find(params[:id])
          params[:updater_id] = params[:user_id]
          if author.update(author_params_update)
            render json: { status: 'SUCCESS', message: 'Author saved', data:author }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Author not saved', data:author.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def author_params_create
          params.permit(:name_author, :status_id, :creator_id)
        end

        def author_params_update
          params.permit(:name_author, :status_id, :updater_id)
        end
        def checkIfAdmin
          if params[:is_admin] != 1
            render json: {message: 'You are not admin'}, status: 401
          end
        end

      end
    end
  end
end
