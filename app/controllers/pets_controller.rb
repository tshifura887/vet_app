class PetsController < ApplicationController
    
    def index 
        request = VetsApi::Pet.new(cookies[:auth_token]).get_pets
        @pets = request.parsed_response
    end

    def create
        response = VetsApi::Pet.new(cookies[:auth_token], params: pet_params).create_pet
        @pet = response.parsed_response
        if @pet
            redirect_to pet_path(@pet['id'])
        else 
            render :new
        end
    end

    def show 
        request = VetsApi::Pet.new(cookies[:auth_token], params: params).show_pet
        @pet =  request.parsed_response
    end
    
    private
    
    def pet_params 
        params.permit(:name, :pet_type, :pet_breed, :age, :authenticity_token, :commit)
    end

end
