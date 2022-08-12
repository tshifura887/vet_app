class RegistrationsController < ApplicationController
    before_action :set_user
    def show 
        response = VetsApi::Registration.new(cookies[:auth_token], params: params).get_registration_details
        @registration = response.parsed_response
    end

    def new 
        #call pet
        @pet = VetsApi::Pet.new(cookies[:auth_token], params: params).show_pet
    end

    def create 
        response = VetsApi::Registration.new(cookies[:auth_token], params: registration_params).register_pet
        if response.created?
            @registration = response.parsed_response
            redirect_to pet_path(id: params['pet_id'])
        else 
            render :new
        end
    end

    def update 
        response = VetsApi::Registration.new(cookies[:auth_token], params: params).accept_registration
        @registration = response.parsed_response
        redirect_to pet_registration_path
    end

    def destroy
        @registration = VetsApi::Registration.new(cookies[:auth_token], params: params).delete_registration
        redirect_to pet_path(id: params['pet_id'])
    end
    private 

    def registration_params
        params.permit(:vet_name,:id, :pet_id, :authenticity_token, :commit)
    end

    def set_user 
        response = VetsApi::User.new(cookies[:auth_token]).get_user
        @user = response.parsed_response
    end
end
