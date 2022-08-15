class VetsApi::Appointment < VetsApi
    def create_appointment
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/appointments", body: @params, headers: @headers)
    end

end