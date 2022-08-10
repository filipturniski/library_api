module Api
  module V1
    module Management
      class AuthorController < ApplicationController
        before_action :checkIfAdmin

        def index
          author = Author.active().order('name_Author ASC').order('name_author ASC')
          author = author.search(params[:authorName]) if params[:authorName].present?
          render json: { status: 'SUCCESS', message: 'Loaded author', data: author }, status: :ok
        end

        def create
          params[:creator_id] = params[:user_id_auth]
          params[:updater_id] = params[:user_id_auth]
          author = Author.new(author_params_create)
          if author.save
            render json: { status: 'SUCCESS', message: 'Author saved', data: author }, status: :created
          else
            render json: { status: 'ERROR', message: 'Author not saved', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def destroy
          author = Author.searchActiveAuthorsId(params[:id]).update({status_id: 5, updater_id: params[:user_id_auth]})
          if author.empty?
            render json: { status: 'ERROR', message: 'wrong Author id', data: author }, status: :unprocessable_entity
          elsif author
            render json: { status: 'SUCCESS', message: 'Author destroyed', data: author }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not destroyed', data: author.errors },
                   status: :unprocessable_entity
          end
        end

        def update
          params[:updater_id] = params[:user_id_auth]
          author = Author.searchActiveAuthorsId(params[:id]).update(author_params_update)

          if author.empty?
            render json: { status: 'ERROR', message: 'wrong Author id', data: author }, status: :unprocessable_entity
          elsif author
            render json: { status: 'SUCCESS', message: 'Author updated', data:author }, status: :accepted
          else
            render json: { status: 'ERROR', message: 'Author not updated', data:author.errors },
                   status: :unprocessable_entity
          end
        end

        private

        def author_params_create
          params.permit(:name_author, :status_id, :creator_id, :updater_id)
        end

        def author_params_update
          params.permit(:name_author, :status_id, :updater_id)
        end


      end
    end
  end
end
