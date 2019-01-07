module Api
  class ProductsController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: {data: Product.page(params[:page]).per(10), total: Product.page(params[:page]).per(10).total_pages } }
      end
    end
  end
end