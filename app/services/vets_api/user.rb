class VetsApi::User < VetsApi
    def create_user 
        response = HTTParty.post("http://127.0.0.1:3000/signup", body: @params)
    end

    def authenticate 
        response = HTTParty.post("http://127.0.0.1:3000/auth/login", body: @params)
    end

end
