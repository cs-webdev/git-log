require "rails_helper"

feature "Guest views repo created commits" do
  scenario "from the repository page" do
    repo = Repository.create(working_dir: "~/rails_project/git-log", name: "Git-Log")
    repo.stub(:logs).and_return(stubbed_logs)
    Repository.stub(:find).and_return(repo)

    visit repository_path(repo)


    expect(page).to have_text "This is a log message"

  end
end

def stubbed_logs
  [
    double("LogEntry", message: "This is a log message", sha: "baderous")
  ]
end
