module Api
  module V1
    class ArmorsController < ApplicationController
      def index
        build_armor_query
      end
      def show

      end
      def create

      end
      def update

      end
      def destroy

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
