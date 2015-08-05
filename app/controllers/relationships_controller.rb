class RelationshipsController < ApplicationController
	def create
		@follower = User.find(params[:followed_id])
		current_user.follow(@follower)
		redirect_to @follower
	end

	def destroy
		unfollower = Relationship.find(params[:id]).followed
		current_user.unfollow(unfollower)
		redirect_to unfollower
	end
	private
end
