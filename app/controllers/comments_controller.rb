class CommentsController < ApplicationController
	def new
	end

	def create
		@comment = Message.find(params[:comment][:message_id]).comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to current_user, notice: "Comment was successfully created."
		else
			render action: "new"
		end
	end

	private
		def set_comment
			@comment = Comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:content)
		end
end
