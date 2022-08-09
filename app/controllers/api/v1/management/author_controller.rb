module Api
  module V1
    module Management
      class AuthorController < ApplicationController
        def index
          author = Authors.select('id', 'name_author', 'status_id').order('name ASC')
          render json: { status: 'SUCCESS', message: 'Loaded Authors', data: author }, status: :ok
        end

        def search
          author = Authors.where(" upper(name_author) LIKE upper(?) and status_id <> 3", "%#{params[:authorName]}%").select('id', 'name_author', 'status_id').order('name_author ASC')
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
          updateAuthorTable(params, 'Deleted Author', 'Not Author Author', status_id: 3)
        end

        def update
          updateAuthorTable(params, 'Author updated', 'Author not updated', author_params)
        end

        private

        def author_params
          params.permit(:name_author, :status_id)
        end

        def updateAuthorTable(params, message, errorMessage, updateValue)
          if params[:id].to_i != 0
            author = Authors.where(" id is ? and status_id <>3", params[:id]).update(updateValue)
            ifUpdatedAuthorTable(author, message, errorMessage)
          else
            author = Authors.where(" name is ? and status_id <>3", params[:id])
            ifUpdatedAuthorTable(author, message, errorMessage)
          end
        end

        def ifUpdatedAuthorTable(author, message, errorMessage)
          if author.presence
            render json: { status: 'SUCCESS', message: message, data: author }, status: :ok
          else #TODO error hendeling
            render json: { status: 'ERROR', message: errorMessage, data: author },
                   status: :unprocessable_entity
          end
        end

      end
    end
  end
end
