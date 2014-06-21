class CommitsController < ApplicationController
	
	def show
		repo = Repository.find( params[:repository_id] )
		@commit  = repo.commit(params[:id])
    @other_commits = repo.other_commits(@commit)
	end
end