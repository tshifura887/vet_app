class VetsApi 
    def initialize(auth_token= '', params: {})
        @headers = {'Authorization': auth_token}
        @params = params
        api_url = 'http://127.0.0.1:3000'
    end
end