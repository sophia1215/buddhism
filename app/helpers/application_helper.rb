module ApplicationHelper
	def avatar_url(member)
	  if member.avatar_url.present?
	    member.avatar_url
	  else
	    default_url = "#{root_url}images/guest.png"
	    gravatar_id = Digest::MD5.hexdigest(member.email.downcase)
	    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
	  end
	end
end
