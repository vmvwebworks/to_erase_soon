module Api
  module V1
    class ArmorsController < ApplicationController
      def index
        build_armor_query
      end
      def show
        @armor = Armor.find(params[:id])
        json_response(@armor)
      end
      def create
        @armor = Armor.create(armor_params)
        json_response(@armor, :created)
      end
      def update
        @armor = Armor.find(params[:id])
        @armor.update(armor_params)
        json_response(@armor, :updated)
      end
      def destroy
        @armor = Armor.find(params[:id])
        @armor.zombie_armors.destroy
        @armor.destroy
        json_response(@armor, :destroyed)
      end
      private

      def build_armor_query
        @armors = Armor.all
        @armors = @armors.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @armors = @armors.where("defense_points LIKE ?", params[:defense_points]) if params[:defense_points]
        @armors = @armors.where("durability LIKE ?", params[:durability]) if params[:durability]
        @armors = @armors.where("price LIKE ?", params[:price]) if params[:price]
        json_response(@armors)
      end
      def armor_params
        params.permit(:name, :defense_points, :durability, :price, :done)
      end
    end
  end
end
