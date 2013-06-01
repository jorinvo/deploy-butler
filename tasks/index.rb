require 'homepage'

class Tasks
	def homepage
		dir = '/var/www/virtual/jorin/html/hompage'
		git_url = 'git@gitlab.com:jorin/jorin-vogel-com.git'

		Homepage.new(dir, git_url).run
	end
end