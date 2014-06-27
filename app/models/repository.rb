class Repository < ActiveRecord::Base

	def logs
		repo.log
	end

  def branches
    repo.branches.local
  end

	def commit(sha)
		repo.gcommit(sha)
	end

  def diff(sha)
    repo.diff(repo.gcommit(sha))
  end

  def diff_commits(sha1, sha2)
    repo.diff(repo.gcommit(sha1), repo.gcommit(sha2))
  end

  def other_commits(sha)
    @other_logs = []
    logs.each do |log|
      @other_logs << log if log.sha != sha
    end
    @other_logs
  end

	private
	def repo
		@_repo ||= Git.open(working_dir, :log => Logger.new(STDOUT))
	end

end
