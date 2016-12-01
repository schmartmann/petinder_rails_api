class Api::V1::PetsController < ApplicationController

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find_by(params[:id])
    render json: @pet
  end

end
