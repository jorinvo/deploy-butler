require_relative 'homepage'

class Tasks
	def self.homepage
		dir = '/tmp/test'
		git_url = 'git@gitlab.com:jorin/jorin-vogel-com.git'

		Homepage.new(dir, git_url).run
	end
end