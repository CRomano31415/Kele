require 'httparty'
require 'json'

class Kele
	include HTTParty
	include JSON


  	base_uri 'https://www.bloc.io/api/v1'

	def initialize(email, pass)
		response = self.class.post('/sessions', body: {"email": email, "password": pass})
		raise 'Invalid Email and/or Password' if response.code != 200
		@auth_token = response["auth_token"]
	end

	def get_me
		response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
		@user = JSON.parse(response.body)
	end 

end 
