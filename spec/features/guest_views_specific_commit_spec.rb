require "rails_helper"

feature "Guest views specific commit" do
  scenario "from the commit page" do
    repo = Repository.create(working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:commit).and_return(stubbed_commit)

    visit repository_commit_path(repo, stubbed_commit.sha)

    expect(page).to have_text "This is a commit"
  end

  def stubbed_commit
    @stubbed_commit ||= double("CommitLog", sha: "fea3aea", message: "This is a commit", parents:[], author: double("AuthorLog", name:"John"))
  end
end
