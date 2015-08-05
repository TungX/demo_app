class EntriesController < ApplicationController
	def index
		@entries = logged_in? ? current_user.feed.paginate(page: params[:page], per_page:10) : Entry.all.paginate(page: params[:page], per_page:10)
		@comment = current_user.comments.build if logged_in?
	end
	def create
		entry = current_user.entries.build(entry_params)
		if entry.save
			flash[:success] = "Etry created!"
		end
		redirect_to current_user
	end
	def show
		
	end

	private
	def entry_params
      params.require(:entry).permit(:title, :content, :picture)
  	end
end
