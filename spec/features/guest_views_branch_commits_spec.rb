require "rails_helper"

feature 'Guest views branch commits' do
  scenario 'from the branch page' do
    repo = Repository.create(working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:branch_commits).and_return(stubbed_branch)
    visit repository_branch_path(repo,stubbed_branch)


    expect(page).to have_text "This is a log message"

  end
end

def stubbed_branch
  [
    double("BranchEntry", full: 'Master')
  ]
end
