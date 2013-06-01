require 'git'

class Homepage

	def initialize(dir, git_url)
		@dir = dir
		@git_url = git_url
	end

	def run
		if dir_exists?
			update_repo
		else
			clone_repo
		end
		setup
	end


	private

	def update_repo
		puts 'update homepage ...'
		git = Git.open @dir
		git.checkout '.'
		git.pull
		puts '... done!'
	end

	def clone_repo
		puts 'fetch homepage ...'
		Git.clone @git_url, @dir
		puts '... done!'
	end

	def setup
		puts 'setup homepage ...'
		Dir.chdir @dir
		system 'bundle'
		system 'rake'
		puts '... homepage is ready!'
	end

	def dir_exists?
		File.directory? @dir
	end

end