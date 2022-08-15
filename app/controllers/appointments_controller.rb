class AppointmentsController < ApplicationController
    before_action :set_user
   
    def create 
        response = VetsApi::Appointment.new(cookies[:auth_token], params: appointment_params).create_appointment
        if response.created?
            @appointment = response.parsed_response
            redirect_to pet_path(id: @appointment['pet_id'])
        else  
            render :new 
        end
    end

    private 
    def appointment_params 
        params.permit(:appointment_date, :authenticity_token, :commit, :pet_id)
    end

    def set_user 
        response = VetsApi::User.new(cookies[:auth_token]).get_user
        @user = response.parsed_response
    end
end
