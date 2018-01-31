module Api
  module V1
    class WeaponsController < ApplicationController
      def index
        build_weapon_query
      end
      def show
        @weapon = Weapon.find(params[:id])
        json_response(@weapon)
      end
      def create
        @weapon = Weapon.create(weapon_params)
        json_response(@weapon, :created)
      end
      def update
        @weapon = Weapon.find(params[:id])
        @weapon.update(weapon_params)
        json_response(@weapon)
      end
      def destroy
        @weapon = Weapon.find(params[:id])
        @weapon.zombie_weapons.destroy
        @weapon.destroy
        json_response(@weapon)
      end
      private

      def build_weapon_query
        @weapons = Weapon.all
        @weapons = @weapons.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @weapons = @weapons.where("attack_points LIKE ?", params[:defense_points]) if params[:defense_points]
        @weapons = @weapons.where("durability LIKE ?", params[:durability]) if params[:durability]
        @weapons = @weapons.where("price LIKE ?", params[:price]) if params[:price]
        json_response(@weapons)
      end
      def weapon_params
        params.permit(:name, :attack_points, :durability, :price, :done)
      end
    end
  end
end
