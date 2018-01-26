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
        
      end
      def destroy

      end

      private

      def item_params
        params.permit(:name, :done)
      end

    end
  end
end
