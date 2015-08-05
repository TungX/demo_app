class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end

  def show    
  	@user = User.find(params[:id])
    @entries = @user.entries.paginate(page: params[:page], per_page:10)
    @entry = @user.entries.build if logged_in?
    @comment = @user.comments.build if logged_in?
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:complete] = "Register complete."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  	
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page:10)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page:10)
  end

  def destroy
    
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
  end
end
