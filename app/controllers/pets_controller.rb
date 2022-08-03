class PetsController < ApplicationController
    before_action :set_user
    
    def index 
        response = VetsApi::Pet.new.get_pets
        if response.success?
           @pets = response[:pets]
        else  
            flash.now[:error] = 'Could not find pets'
            @pets = []
        end
    end

    def create 
        response = VetsApi::Pet.new(params: pet_params).create_pet
        redirect_to pet_path(@pet)
    end

    def show 
        response = VetsApi::Pet.new.show_pet
    end
    
    private
    
    def pet_params 
        params.permit(:name, :pet_type, :pet_breed, :age)
    end

    def set_user 
        cookies[:auth_token] = cookies
        response = VetsApi::User.new(cookies).get_user
        user = response.parsed_response
    end
end
