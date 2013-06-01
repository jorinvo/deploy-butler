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
		git = Git.open @dir
		git.checkout '.'
		git.pull
		puts 'updated repo'
	end

	def clone_repo
		Git.clone @git_url, @dir
		puts 'cloned repo'
	end

	def setup
		Dir.chdir @dir
		system 'bundle'
		system 'rake'
		puts 'repo is ready'
	end

	def dir_exists?
		File.directory? @dir
	end

end