Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :zombies, only: ['index', 'show', 'create'] do
        collection do
          post 'update/:id', to: 'zombies#update'
          post 'destroy/:id', to: 'zombies#destroy'
        end
      end
    end
  end
end
