class HealthController < ApplicationController
  def check
    render json: 'Healthy!!!'
  end
end
