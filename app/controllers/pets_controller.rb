class PetsController < ApplicationController
    before_action :set_user
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
        response = VetsApi::Pet.new(cookies[:auth_token], params: params).show_pet
        @pet = response.parsed_response
        registrations = VetsApi::Pet.new(cookies[:auth_token], params: params).get_registrations(@pet['id'])
        @registrations = registrations.parsed_response
    end

    def destroy 
        request = VetsApi::Pet.new(cookies[:auth_token], params: params).delete_pet
        redirect_to pets_path
    end
    
    private
    
    def pet_params 
        params.permit(:name, :pet_type, :pet_breed, :age, :authenticity_token, :commit)
    end

    def set_user 
        response = VetsApi::User.new(cookies[:auth_token]).get_user
        @user = response.parsed_response
    end

end
