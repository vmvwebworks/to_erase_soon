module Api
  module V1
    class ZombiesController < ApplicationController
      def index
        @zombies = Zombie.all
        json_response(@zombies)
      end
      def create

      end
      def show

      end
      def update

      end
      def destroy

      end
    end
  end
end
