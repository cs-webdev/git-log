class RepositoriesController < ApplicationController

	def index
		@repos = Repository.all
	end

	def show
		repo = Repository.find params[:id]
		@logs = Git.open(repo.working_dir, :log => Logger.new(STDOUT)).log
	end

	
end