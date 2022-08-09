Rails.application.routes.draw do
  namespace 'api' do
      namespace 'v1' do
          resources :status,  only: [:index, :show] do
      end
        end
    end

  namespace 'api' do
    namespace 'v1' do
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
    end
  end
end