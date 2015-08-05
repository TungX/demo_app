module UsersHelper
	def gravatar_for(user)
		url = user.avatar? ?  user.avatar : "rails.png"
    image_tag(url, height: '52')
  end
end
