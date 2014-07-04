class CommitsController < ApplicationController
  expose(:repository)

  def show
    @commit = repository.commit(params[:id])
    @other_commits = repository.other_commits(@commit.sha)
    @stats = @commit.diff_parent.stats if( @commit.parents.size > 0)
	end
end
