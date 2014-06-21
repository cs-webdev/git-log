class Repository < ActiveRecord::Base
	def logs
		Git.open(working_dir, :log => Logger.new(STDOUT)).log
	end
end