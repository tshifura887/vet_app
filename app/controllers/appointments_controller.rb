class AppointmentsController < ApplicationController
    before_action :set_user
    def index 
        response = VetsApi::Appointment.new(cookies[:auth_token], params: params).get_appointments
        @appointments = response.parsed_response
    end

    def create 
        response = VetsApi::Appointment.new(cookies[:auth_token], params: appointment_params).create_appointment
        @appointment = response.parsed_response
        if @appointment
            redirect_to pet_registration_appointments_path
        else  
            render :new 
        end
    end

    private 
    def appointment_params 
        params.permit(:appointment_date, :authenticity_token, :commit, :pet_id, :registration_id)
    end

    def set_user 
        response = VetsApi::User.new(cookies[:auth_token]).get_user
        @user = response.parsed_response
    end
end
