class AppointmentsController < ApplicationController
    def index 

    end

    def create 
        response = VetsApi::Appointment.new(cookies[:auth_token], params: appointment_params).create_appointment
        @appointment = response.parsed_response
        redirect_to pet_registration_appointments_path
    end

    private 
    def appointment_params 
        params.permit(:appointment_date, :authenticity_token, :commit, :pet_id, :registration_id)
    end
end
