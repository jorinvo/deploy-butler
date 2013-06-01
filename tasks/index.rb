require_relative 'homepage'

class Tasks
	def self.homepage
		dir = '/var/www/virtual/jorin/html/homepage'
		git_url = 'git@gitlab.com:jorin/jorin-vogel-com.git'

		Homepage.new(dir, git_url).run
	end
end