require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
	include HTTParty
	include JSON
	include Roadmap

  	base_uri BASE_URL

	def initialize(email, pass)
		response = self.class.post('/sessions', body: {"email": email, "password": pass})
		raise 'Invalid Email and/or Password' if response.code != 200
		@auth_token = response["auth_token"]
	end

	def get_me
		response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
		@user = JSON.parse(response.body)
	end 

	def get_mentor_availability(mentor_id)
		response = self.class.get("/mentors/#{mentor_id}/student_availability", values: { "id" => mentor_id}, headers: { "authorization" => @auth_token })
		@mentor_availability = JSON.parse(response.body)
		@mentor_availability.to_a
	end 

end 
