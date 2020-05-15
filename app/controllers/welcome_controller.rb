class WelcomeController < ApplicationController
  def index
    render json: {
      message: "Welcome to Getting started guide of Dokku",
      secret_variable: ENV['SECRET_VARIABLE']
    }
  end
end
