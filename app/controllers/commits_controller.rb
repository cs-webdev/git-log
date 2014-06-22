class CommitsController < ApplicationController
	
	def show
		@repo = Repository.find( params[:repository_id] )
		@commit  = @repo.commit(params[:id])
    @other_commits = @repo.other_commits(@commit)
    @stats = @commit.diff_parent.stats if( @commit.parents.size > 0)
    
	end
end