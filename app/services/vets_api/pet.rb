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

    def get_user 
        response = HTTParty.get("http://127.0.0.1:3000/user/:id", headers: @headers)
    end
end