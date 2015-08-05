class CommentsController < ApplicationController
	def create		
		comment = current_user.comments.build(comment_params) if logged_in?
		if logged_in?
			if !comment.save
				flash[:error] = "Cannot comment!"
			end
		else
			flash[:error] = "Cannot comment!"
		end
		
		if comment_params[:user_id] == "-1"
			redirect_to root_url
		else
			user = User.find (comment_params[:user_id])
			if !user.nil?
				redirect_to user
			else
				redirect_to root_url
			end
		end

		
		
	end
	private
	def comment_params
		params.require(:comment).permit(:content, :entry_id, :user_id)
	end
end
