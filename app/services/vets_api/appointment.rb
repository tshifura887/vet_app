class VetsApi::Appointment < VetsApi
    def create_appointment
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/appointments", body: @params, headers: @headers)
    end

    def get_appointments(pet_id)
        response = HTTParty.get("http://127.0.0.1:3000/pets/#{pet_id}/appointments", headers: @headers)
    end
end