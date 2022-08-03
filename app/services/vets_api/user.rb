class VetsApi::User < VetsApi
    def create_user 
        response = HTTParty.post("#{@api_url}/signup", body: @params)
    end

    def authenticate 
        response = HTTParty.post("#{@api_url}/auth/login", body: @params)
    end

    def get_user 
        response = HTTParty.get("#{@api_url}/user/:id", headers: @headers)
    end
end