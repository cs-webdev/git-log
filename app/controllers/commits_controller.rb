class CommitsController < ApplicationController
  before_filter :get_repo

  def get_repo
    @repo = Repository.find(params[:repository_id])
  end

	def show
    @commit = @repo.commit(params[:id])
    @other_commits = @repo.other_commits(@commit.sha)
    @stats = @commit.diff_parent.stats if( @commit.parents.size > 0)
	end
end
