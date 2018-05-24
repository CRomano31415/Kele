	module Roadmap

	def get_roadmap(chain_id)
		#6493
		response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{chain_id}", values: { "id" => chain_id}, headers: { "authorization" => @auth_token })
		@roadmap = JSON.parse(response.body)
	end 

	def get_checkpoint(checkpt_id)
		response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{checkpt_id}", values: { "id" => checkpt_id}, headers: { "authorization" => @auth_token })
		@checkpt = JSON.parse(response.body)
	end 
end 