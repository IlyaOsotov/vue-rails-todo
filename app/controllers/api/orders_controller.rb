module Api
  class OrdersController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: Order.all }
      end
    end
  end
end