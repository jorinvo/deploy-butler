class Repo

	def initialize(dir, git_url)
		@dir = dir
		@git_url = git_url
	end

	def update
		if dir_exists?
			update_repo
		else
			clone_repo
		end
	end


	private

	def update_repo
		puts 'update existing repo ...'
		Dir.chdir @dir
		system "git pull origin master"
		puts '... done!'
	end

	def clone_repo
		puts 'fetch repo ...'
		system "git clone #{@git_url} #{@dir}"
		puts '... done!'
	end

	def dir_exists?
		File.directory? @dir
	end

end