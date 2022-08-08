class VetsApi::Registration < VetsApi
    def register_pet 
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations", body: {vet_name: @params[:vet_name]}, headers: @headers)
    end

    def accept_registration
        response = HTTParty.put("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:id]}", headers: @headers)
    end
end