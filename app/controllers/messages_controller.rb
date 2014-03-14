class MessagesController < ApplicationController
	def new
	end

	def create
		@message = current_user.messages.new(message_params)
		if @message.save
			redirect_to current_user, notice: "Message was successfully created."
		else
			render action: "new"
		end
	end

	private
		def set_message
			@message = Message.find(params[:id])
		end

		def message_params
			params.require(:message).permit(:description)
		end
end
