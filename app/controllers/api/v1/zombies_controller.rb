module Api
  module V1
    class ZombiesController < ApplicationController
      def index
        build_query

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
        @zombie.destroy
        json_response(@zombie)
      end


      private
      def build_query
        @zombies = Zombie.where("name LIKE ?", "%#{params[:name]}%") if params[:name]
        @zombies = @zombies.where("hit_points LIKE ?", params[:hit_points]) if params[:hit_points]
        json_response(@zombies)
      end

      def zombie_params
        params.permit(:name, :hit_points, :brains_eaten, :speed, :turn_date, :done)
      end

    end
  end
end
