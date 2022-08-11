class VetsApi::Appointment < VetsApi
    def create_appointment 
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:registration_id]}/appointments", body: @params, headers: @headers)
    end

    def get_appointments 
        response = HTTParty.get("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:registration_id]}/appointments", headers: @headers)
    end
end