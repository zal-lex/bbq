module ApplicationHelper
	def user_avatar(user)
		# TODO: user real avatar
		asset_path('user.png')
	end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
