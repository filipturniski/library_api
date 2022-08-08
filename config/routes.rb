Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :status,  only: [:index, :show] do
      end
    end
  end
  namespace 'api' do
    namespace 'v1' do
      resources :books
    end
  end
end
