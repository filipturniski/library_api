Rails.application.routes.draw do
  namespace 'api' do
      namespace 'v1' do
          namespace 'catalog' do
            resources :books,  only: [ :search] do
              collection do
                get :search
              end
            end
            resources :authors,  only: [ :search] do
              collection do
                get :search
              end
            end
          end
          namespace 'management' do
            resources :book,  only: [ :search, :create, :index, :create, :destroy, :update] do
              collection do
                get :search
              end
            end
            resources :author,  only: [ :search, :create, :index, :create, :destroy, :update] do
              collection do
                get :search
              end
            end
          end
        end
    end

end