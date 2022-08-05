class RegistrationsController < ApplicationController

    def create 
        response = VetsApi::Registration.new(cookies[:auth_token], params: pet_params).create_pet
        @pet = response.parsed_response
        if @pet
            redirect_to pet_path(@pet['id'])
        else 
            render :new
        end
    end

    private 

    def registration_params
        params.permit(:requested, :accepted, :registration_date)
    end
end
