class Api::V1::PetsController < ApplicationController

  def index
    @pets = Pet.all
    response = HTTParty.get('http://api.petfinder.com/pet.find?location=11103&output=full&format=json&key=f5782a311d586e36c2533d556726d6d5')
    @petsFromAPI = [];
    response['petfinder']['pets']['pet'].each do |pet|
      @petsFromAPI.push(
        {
          city: pet['contact']['city']['$t'],
          state: pet['contact']['state']['$t'],
          photo: pet['media']['photos']['photo'],
          id: pet['id']['$t'],
          link: "http://www.petfinder.com/petdetail/#{pet['id']['$t']}",
          name: pet['name']['$t'],
          description: pet['description']['$t'],
          animal: pet['animal']['$t']
        }
      )
    end
    @petsExport = {
      first: @pets,
      second: @petsFromAPI
    }
    render json: @petsExport
  end

  def show
    @pet = Pet.find_by(params[:id])
    render json: @pet
  end

  # def petFind
  #   response = HTTParty.get('http://api.petfinder.com/pet.find?location=11103&output=full&format=json&key=f5782a311d586e36c2533d556726d6d5')
  #   puts response
  # end


end
