class Api::V1::PetsController < ApplicationController

  def index
    puts "these are the params: #{params[:location]}"
    puts "this is the current time: #{Time.now()}"
    puts ENV["PF_KEY"]
    location = params[:location]
    @pets = Pet.all
    response = HTTParty.get("http://api.petfinder.com/pet.find?location=#{location}&output=full&format=json&key=#{ENV['PF_KEY']}")
    @petsFromAPI = [];

    response['petfinder']['pets']['pet'].each do |pet|

      puts "pet media contents: #{pet['media']}"
      if pet['media'].empty?
        puts "#{pet['name']['$t']}'s photos are empty'"
        pet['media'] = {"photos" => {"photo" => [{"@size" => 'x',"$t" => 'https://www.petfinder.com/wp-content/themes/petfinder2013/img/search/no-photo-profile.png',"@id" => '1'}]}}
        puts "pet[media]: #{pet['media']}"
        pet['media']['photos']['photo'].push(

        )
        puts "#{pet['media']['photos']['photo'][0]}"
      else
        pet
      end

      if pet['description'].empty?
        pet['description']['$t'] = 'Description unavailable'
      else
        pet
      end

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
