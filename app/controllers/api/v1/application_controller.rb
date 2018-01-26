module Api
  module V1
    class ApplicationController < ActionController::API
      include Response
      include ExceptionHandler
    end
  end
end
