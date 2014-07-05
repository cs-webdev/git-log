class Repository < ActiveRecord::Base

  def logs
    repo.log
  end

  def branches
    repo.branches.local
  end

  def get_branch(branch)
    repo.branches[branch]
  end

  def commit(sha)
    repo.gcommit(sha)
  end

  def branch_commits(branch)
    repo.log.object(branch)
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

  def group_by_authors
    authors = []
    repo.log.each do |l|
      authors << l.author.name
    end

    authors.group_by(&:capitalize).map{ |k, v| [k, v.length] }
  end

  def group_by_day
    dates = []
    repo.log.each do |l|
      dates << l.date.strftime("%d-%m-%y")
    end

    dates.group_by(&:capitalize).map{ |k, v| [k, v.length] }
  end

  private
  def repo
    @_repo ||= Git.open(working_dir, :log => Logger.new(STDOUT))
  end

end
