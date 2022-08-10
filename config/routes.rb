Rails.application.routes.draw do
  namespace 'api' do
      namespace 'v1' do
          namespace 'catalog' do
            resources :book,  only: [ :index] do
              collection do
                get :search
              end
            end
            resources :author,  only: [ :index] do
              collection do
                get :search
              end
            end
          end
          namespace 'management' do
            resources :book,  only: [ :create, :index, :destroy, :update]
            resources :author,  only: [ :create, :index, :destroy, :update]
            resources :member,  only: [ :create, :index, :destroy, :update]
            resources :loan,  only: [ :create, :index, :destroy, :update]
          end
          namespace 'dashboard' do
            resources :loan,  only: [ :index]
          end
        end
    end

end