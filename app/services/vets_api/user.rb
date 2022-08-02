class VetsApi::User < VetsApi
    def create_user 
       response = HTTParty.get("#{@api_url}", headers: headers) 
    end
end