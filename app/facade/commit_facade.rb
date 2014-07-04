# app/facades/commit_facade.rb
class CommitFacade
  attr_reader :repository, :id

  def initialize( repository, id )
    @repository = repository
    @id = id
    @commit = @repository.commit( @id )
  end

  def details
    @commit
  end

  def other_commits
    @other_commits = @repository.other_commits( @commit.sha )
  end

  def stats
    @stats = @commit.diff_parent.stats if( @commit.parents.size > 0)
  end
end
