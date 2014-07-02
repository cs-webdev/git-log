require "rails_helper"

feature 'Guest views other commits' do
  scenario 'from the commit page' do
    repo = Repository.create(working_dir: "~/rails_project/git-log")
    Repository.stub(:find).and_return(repo)
    repo.stub(:commit).and_return(stubbed_commit)
    repo.stub(:other_commits).and_return(stubbed_other_commits)

    visit repository_commit_path(repo.id, stubbed_commit.sha)

    expect(page).to have_text "This is other commit"

  end
end

def stubbed_commit
  @stubbed_commit ||= double("CommitLog", sha: "fea3aea", message: "This is a commit", parents:[], author: double("AuthorLog", name:'John'))
end

def stubbed_other_commits
  [
    @stubbed_other_commits ||= double("Other Commit", sha: "tea4aeb", message: "This is other commit")
  ]
end
