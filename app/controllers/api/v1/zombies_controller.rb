module Api
  module V1
    class ZombiesController < ApplicationController
      def index
        @zombies = Zombie.all
        json_response(@zombies)
      end
      def show
        @zombie = Zombie.find(params[:id])
        json_response(@zombie)
      end
      def create
        @zombie = Zombie.create!(item_params)
        json_response(@zombie, :created)
      end
      def update
        @zombie = Zombie.find(params[:id])
        puts item_params
      end
      def destroy

      end


      private

      def item_params
        params.permit(:name, :hit_points, :brains_eaten, :speed, :turn_date, :done)
      end

    end
  end
end
