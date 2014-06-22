class Repository < ActiveRecord::Base

	def logs
		repo.log
	end

	def commit(sha)
		repo.gcommit(sha)
	end

  def diff(commit)
    repo.diff(commit)
  end

  def diff_commits(commit1, commit2)
    repo.diff(commit1, commit2)
  end

  def other_commits(commit)
    @other_logs = []
    logs.each do |log|
      @other_logs << log if log.sha != commit.sha
    end
    @other_logs
  end

	private
	def repo
		@_repo ||= Git.open(working_dir, :log => Logger.new(STDOUT))
	end

end