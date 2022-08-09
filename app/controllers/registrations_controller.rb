class RegistrationsController < ApplicationController
    def new 
        #call pet
        @pet = VetsApi::Pet.new(cookies[:auth_token], params: params).show_pet
    end
    def create 
        response = VetsApi::Registration.new(cookies[:auth_token], params: registration_params).register_pet
        @registration = response.parsed_response
        if @registration
            redirect_to pet_path(id: params['pet_id'])
        else 
            render :new
        end
    end

    def update 
        @registration = VetsApi::Registration.new(cookies[:auth_token], params: params).accept_registration
        redirect_to pet_path(id: params['pet_id'])
    end

    def destroy
        @registration = VetsApi::Registration.new(cookies[:auth_token], params: params).delete_registration
        redirect_to pet_path(id: params['pet_id'])
    end
    private 

    def registration_params
        params.permit(:vet_name,:id, :pet_id, :authenticity_token, :commit)
    end
end
