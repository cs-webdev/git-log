class Repository < ActiveRecord::Base


	def logs
		repo.log
	end

	def commit(sha)
		repo.gcommit(sha)
	end

  def other_commits(commit)
    @other_logs = []
    @a = commit.sha
    self.logs.each do |log|
      if log.sha != commit.sha
        @other_logs << log
      end
    end
    return @other_logs
  end

	private
	def repo
		@_repo ||= Git.open(working_dir, :log => Logger.new(STDOUT))
	end

end