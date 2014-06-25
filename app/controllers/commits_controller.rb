class CommitsController < ApplicationController
  before_filter :get_repo
  attr_accessor :sha, :message, :author_name, :parent_sha, :parents_size

  def initialize(message, attributes = {})
    @sha=attributes[:sha]
    @message=message
    @author_name=attributes[:author_name]
    @parent_sha=attributes[:parent_sha]
    @parents_size=attributes[:parents_size]
  end

	def show
    repo_commit = @repo.commit(params[:id])
    @commit  = Commit.new(repo_commit.message,
      sha: repo_commit.sha,
      author_name: repo_commit.author.name,
      parent_sha: repo_commit.parent.sha,
      parents_size: repo_commit.parents.size
    )
    @other_commits = @repo.other_commits(@commit.sha)
    @stats = repo_commit.diff_parent.stats if( @commit.parents_size > 0)
	end

  private
  def get_repo
    @repo = Repository.find(params[:repository_id])
  end
end
