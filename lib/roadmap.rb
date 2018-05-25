	module Roadmap

	def get_roadmap(chain_id)
		response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{chain_id}", values: { "id" => chain_id}, headers: { "authorization" => @auth_token })
		@roadmap = JSON.parse(response.body)
	end 

	def get_checkpoint(checkpt_id)
		response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{checkpt_id}", values: { "id" => checkpt_id}, headers: { "authorization" => @auth_token })
		@checkpt = JSON.parse(response.body)
	end 

	def get_messages(page_num = nil)
		if page_num 
			response = self.class.get("https://www.bloc.io/api/v1/message_threads", values: { "page" => page_num}, headers: { "authorization" => @auth_token })
		else
			response = self.class.get("https://www.bloc.io/api/v1/message_threads", headers: { "authorization" => @auth_token })
		end
		@msgs = JSON.parse(response.body)
	end 

	def create_message(sender, recipient, token, subject, stext)
		response = self.class.post("https://www.bloc.io/api/v1/messages", 
					body: { "sender" => sender, "recipient_id" => recipient, "token" => token, "subject" => subject, "stripped-text" => stext}, 
					headers: { "authorization" => @auth_token })
		@msgstatus = JSON.parse(response.body)
	end 
end 