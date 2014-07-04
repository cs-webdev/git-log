require "rails_helper"

describe CommitsController do
  describe "GET show" do

    it "should assigns @repository with exposure" do
      repository = Repository.create(working_dir: "~/rails_project/git-log")
      repository.stub(:commit).and_return(stubbed_commit)
      get :show , repository_id: repository.id , id: stubbed_commit.sha

      expect(controller.repository).to eq(repository)
    end
    
  end
end

def stubbed_commit
  @stubbed_commit ||= double("Commit", sha: "fea3aea", message: "This is a commit")
end