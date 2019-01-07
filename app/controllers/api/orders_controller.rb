module Api
  class OrdersController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: {data: Order.page(params[:page]).per(10), total: Order.page(params[:page]).per(10).total_pages } }
      end
    end

    def create
      
    end
  end
end