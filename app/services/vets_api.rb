class VetsApi 
    include HTTParty
    def initialize(token, params)
        @headers = {'Authorization': token}
        @params = params
        @api_url = 'http://localhost:3000'
    end
end