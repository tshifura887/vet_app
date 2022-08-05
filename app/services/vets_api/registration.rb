class VetsApi::Registration < VetsApi
    def register_pet 
        response = HTTParty.post("http://127.0.0.1:3000/pets/#{@params[:id]}/registrations", body: @params, headers: @headers)
    end
end