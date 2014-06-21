class Commit
	attr_reader :sha,:message

	def self.commit_details( sha )
		repo = Git.open(working_dir, :log => Logger.new(STDOUT))
		repo.gcommit(sha)
	end
end