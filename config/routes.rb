Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :zombies, only: ['index', 'show', 'create'] do
        collection do
          post ':id/update', to: 'zombies#update'
          post ':id/destroy', to: 'zombies#destroy'

          # zombie armors
          get ':id/armors', to: 'zombies#index_armor'
          get ':id/armors/details', to: 'zombies#index_armor_details'
          post ':id/armors/:armor_id', to: 'zombies#add_armor'
          get ':id/armors/:zombie_armor_id', to: 'zombies#show_armor'
          post ':id/armors/:zombie_armor_id/destroy', to: 'zombies#destroy_armor'

          # zombie weapons
          get ':id/weapons', to: 'zombies#index_weapon'
          get ':id/weapons/details', to: 'zombies#index_weapon_details'
          post ':id/weapons/:weapon_id', to: 'zombies#add_weapon'
          get ':id/weapons/:zombie_weapon_id', to: 'zombies#show_weapon'
          post ':id/weapons/:zombie_weapon_id/destroy', to: 'zombies#destroy_weapon'
        end
      end
      resources :armors, only: ['index', 'show', 'create'] do
        collection do
          post ':id/update', to: 'armors#update'
          post ':id/destroy', to: 'armors#destroy'
        end
      end
      resources :weapons, only: ['index', 'show', 'create'] do
        collection do
          post ':id/update', to: 'weapons#update'
          post ':id/destroy', to: 'weapons#destroy'
        end
      end
    end
  end
end
