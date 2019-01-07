module Api
  class ProductsController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: Product.all }
      end
    end
  end
end