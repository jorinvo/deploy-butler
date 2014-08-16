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

	def self.butler

		dir = '/home/jorin/butler'
		git_url = 'git@github.com:jorin-vogel/deploy-butler.git'

		Repo.new(dir, git_url).update

		puts 'setup butler ...'
		Dir.chdir dir
		system 'bundle'
		system 'svc -du /home/jorin/service/butler'
		puts '... butler is ready!'

	end

	def self.study

		dir = '/home/jorin/study'
		git_url = 'git@github.com:jorin-vogel/study-thai.git'

		Repo.new(dir, git_url).update

		puts 'setup study ...'
		Dir.chdir dir
		system 'bundle'
		system 'npm install'
		system './node_modules/gulp/bin/gulp.js build'
		system 'svc -du /home/jorin/service/study'
		puts '... study is ready!'

	end

end