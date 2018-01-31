Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :zombies, only: ['index', 'show', 'create'] do
        collection do
          post ':id/update', to: 'zombies#update'
          post ':id/destroy', to: 'zombies#destroy'
          
          get ':id/armors', to: 'zombies#index_armor'
          get ':id/weapons', to: 'zombies#index_weapon'
          post ':id/add_armor/:armor_id', to: 'zombies#add_armor'
          post ':id/add_weapon/:weapon_id', to: 'zombies#add_weapon'
        end
      end
    end
  end
end
