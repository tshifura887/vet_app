class VetsApi::Pet < VetsApi
    def get_pets
        response = HTTParty.get("http://127.0.0.1:3000/pets", headers: @headers)
    end

    def create_pet
        response = HTTParty.post("http://127.0.0.1:3000/pets", body: @params, headers: @headers)
    end

    def show_pet
        response = HTTParty.get("http://127.0.0.1:3000/pets/#{@params[:id]}", headers: @headers)
    end

    def delete_pet
        response = HTTParty.delete("http://127.0.0.1:3000/pets/#{@params[:id]}", headers: @headers)
    end

end