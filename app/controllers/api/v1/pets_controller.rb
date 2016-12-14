class Api::V1::PetsController < ApplicationController

  def index
    puts "these are the params: #{params}"
    puts "okay"
    puts ENV["PF_KEY"]
    zip = params[:zip]
    @pets = Pet.all
    response = HTTParty.get("http://api.petfinder.com/pet.find?location=#{zip}&output=full&format=json&key=#{ENV['PF_KEY']}")
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
end
