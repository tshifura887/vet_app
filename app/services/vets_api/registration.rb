class VetsApi::Registration < VetsApi
    def register_pet 
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations", body: {vet_name: @params[:vet_name]}, headers: @headers)
    end

    def accept_registration
        response = HTTParty.put("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:id]}", headers: @headers)
    end

    def delete_registration
        response = HTTParty.delete("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:id]}", headers: @headers)
    end

    def get_registration_details 
        response = HTTParty.get("http://127.0.0.1:3000/pets/#{@params[:pet_id]}/registrations/#{@params[:id]}", headers: @headers)
    end
end