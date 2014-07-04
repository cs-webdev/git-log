class DiffController < ApplicationController
  before_filter :get_repo

  def get_repo
    @repo = Repository.find(params[:repository_id])
  end

  def show
    @sha  = params[:commit_id]
    @diff = @repo.diff_commits(params[:commit_id], params[:id])
  end
end
