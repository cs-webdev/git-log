require "rails_helper"

feature "Guest views log branches" do
  scenario "from the repository page" do
    repo = Repository.create(working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:logs).and_return(stubbed_logs)
    repo.stub(:branches).and_return(stubbed_branches)

    visit repository_path(repo)

    expect(page).to have_text "Master"
  end

  def stubbed_logs
    [
      double("LogEntry", message: "This is a log message", sha: "baderous")
    ]
  end

  def stubbed_branches
    [
      double("BranchEntry", name: "Master")
    ]
  end
end
