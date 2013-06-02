require_relative 'scripts/repo'

class Tasks
	def self.homepage

		dir = '/var/www/virtual/jorin/html/homepage'
		git_url = 'git@gitlab.com:jorin/jorin-vogel-com.git'

		Repo.new(dir, git_url).update

		puts 'setup homepage ...'
		Dir.chdir dir
		system 'bundle'
		system 'rake'
		puts '... homepage is ready!'

	end
end