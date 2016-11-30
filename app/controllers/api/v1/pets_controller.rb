class PetsController < ApplicationController

  def index
    @pets = Pets.all
    render json: @pets
  end

  def show
    @pet = Pet.find_by(params[:id])
    render json: @pet
  end

end
