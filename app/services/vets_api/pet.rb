class VetsApi::Pet < VetsApi
    def get_pets
        response = HTTParty.get("#{@api_url}/pets", headers: @headers)
    end

    def create_pet
        response = HTTParty.post("#{@api_url}/pets", body: @params)
    end

    def show_pet 
        response = HTTParty.get("#{@api_url}/#{pet_id}", headers: @headers)
    end
end