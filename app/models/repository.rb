class Repository < ActiveRecord::Base

	def logs
		repo.log
	end

	def commit(sha)
		repo.gcommit(sha)
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