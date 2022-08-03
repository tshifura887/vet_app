class VetsApi 
    def initialize(auth_token= '', params: {})
        @headers = {'Authorization': auth_token}
        @params = params
        @api_url = 'http://localhost:3000'
    end
end