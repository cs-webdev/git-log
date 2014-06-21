class Repository < ActiveRecord::Base


	def logs
		repo.log
	end

	def commit(sha)
		repo.gcommit(sha)
	end

	private
	def repo
		@_repo ||= Git.open(working_dir, :log => Logger.new(STDOUT))
	end

end