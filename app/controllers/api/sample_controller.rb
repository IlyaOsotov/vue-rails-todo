module Api
  class SampleController < ApplicationController
    def index
      respond_to do |format|
        format.json { render json: { key: 'value' } }
      end
    end
  end
end