module Api
  module V1
    class ZombiesController < ApplicationController

      def index
        build_zombies_query
      end

      def show
        @zombie = Zombie.find(params[:id])
        json_response(@zombie)
      end

      def create
        @zombie = Zombie.create(zombie_params)
        json_response(@zombie, :created)
      end

      def update
        @zombie = Zombie.find(params[:id])
        @zombie.update(zombie_params)
        json_response(@zombie)
      end

      def destroy
        @zombie = Zombie.find(params[:id])
        @zombie.zombie_armors.destroy
        @zombie.zombie_weapons.destroy
        @zombie.destroy
        json_response(@zombie)
      end

      def index_armor
        @zombie = Zombie.find(params[:id])
        json_response(@zombie.zombie_armors)
      end

      def index_armor_details
        build_zombie_armors_query
      end

      def show_armor
        @zombie = Zombie.find(params[:id])
        @zombie_armor = @zombie.zombie_armors.find(params[:zombie_armor_id])
        json_response(@zombie_armor.armor)
      end

      def add_armor
        @zombie = Zombie.find(params[:id])
        @zombie_armor = @zombie.zombie_armors.create(armor_id: params[:armor_id])
        json_response(@zombie_armor.armor)
      end

      def destroy_armor
        @zombie = Zombie.find(params[:id])
        @zombie_armor = @zombie.zombie_armors.find(params[:zombie_armor_id])
        @zombie_armor.destroy
        json_response(@zombie_armor)
      end

      def index_weapon
        @zombie = Zombie.find(params[:id])
        json_response(@zombie.zombie_weapons)
      end

      def index_weapon_details
        build_zombie_weapons_query
      end

      def show_weapon
        @zombie = Zombie.find(params[:id])
        @zombie_weapon = @zombie.zombie_weapons.find(params[:zombie_weapon_id])
        json_response(@zombie_weapon.weapon)
      end

      def add_weapon
        @zombie = Zombie.find(params[:id])
        @zombie_weapon = @zombie.zombie_weapons.create(weapon_id: params[:weapon_id])
        json_response(@zombie_weapon.weapon)
      end
      def destroy_weapon
        @zombie = Zombie.find(params[:id])
        @zombie_weapon = @zombie.zombie_weapons.find(params[:zombie_weapon_id])
        @zombie_weapon.destroy
        json_response(@zombie_weapon)
      end




      private

      def build_zombies_query
        @zombies = Zombie.all
        @zombies = Zombie.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @zombies = @zombies.where("hit_points LIKE ?", params[:hit_points]) if params[:hit_points]
        @zombies = @zombies.where("brains_eaten LIKE ?", params[:brains_eaten]) if params[:brains_eaten]
        @zombies = @zombies.where("speed LIKE ?", params[:speed]) if params[:speed]
        @zombies = @zombies.where("turn_date LIKE ?", "%#{params[:turn_date]}%") if params[:turn_date]
        json_response(@zombies)
      end

      def build_zombie_armors_query
        @zombie_armors = Armor.includes(:zombie_armors).where(:zombie_armors => { zombie_id: params[:id] } ).all
        @zombie_armors = @zombie_armors.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @zombie_armors = @zombie_armors.where("defense_points LIKE ?", params[:defense_points]) if params[:defense_points]
        @zombie_armors = @zombie_armors.where("durability LIKE ?", params[:durability]) if params[:durability]
        @zombie_armors = @zombie_armors.where("price LIKE ?", params[:price]) if params[:price]
        json_response(@zombie_armors)
      end

      def build_zombie_weapons_query
        @zombie_weapons = Weapon.includes(:zombie_weapons).where(:zombie_weapons => { zombie_id: params[:id] } ).all
        @zombie_weapons = @zombie_weapons.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @zombie_weapons = @zombie_weapons.where("attack_points LIKE ?", params[:attack_points]) if params[:attack_points]
        @zombie_weapons = @zombie_weapons.where("durability LIKE ?", params[:durability]) if params[:durability]
        @zombie_weapons = @zombie_weapons.where("price LIKE ?", params[:price]) if params[:price]
        json_response(@zombie_weapons)
      end

      def zombie_params
        params.permit(:name, :hit_points, :brains_eaten, :speed, :turn_date, :armor_id, :weapon_id, :done)
      end
    end
  end
end
