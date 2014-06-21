require "rails_helper"

feature 'Guest view log commits' do
	scenario '' do
		repo = Repository.create(:working_dir => "~/rails_project/git-log")
		repo.stub(:logs).and_return(stubbed_logs)
		Repository.stub(:find).and_return(repo)

		visit repository_path(repo)


		expect(page).to have_text "This is a log message"

	end
end

def stubbed_logs
	[
		double("LogEntry", message: 'This is a log message')
	]
end