Rails.application.routes.draw do
  namespace 'api' do
      namespace 'v1' do
          resources :status,  only: [:index, :show] do
          end
          namespace 'catalog' do
            resources :books,  only: [:index, :search] do
              collection do
                get :search
              end
            end
            resources :authors,  only: [:index, :search] do
              collection do
                get :search
              end
            end
          end
          namespace 'management' do
            resources :book do
              collection do
                get :search
              end
            end
          end
        end
    end

end