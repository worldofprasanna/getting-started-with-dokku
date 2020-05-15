class HealthController < ApplicationController
  def check
    render json: { message: 'Healthy!!!' }
  end
end
