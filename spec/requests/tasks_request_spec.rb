require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET tasks" do
    it "returns a successful response" do
      get "/tasks"
      expect(response).to be_successful
    end
  end

  describe "POST task" do
    it "post redirects to tasks" do
      post "/tasks", params: { task: { todo: 'Post redirect test' } }
      expect(response).to redirect_to(:tasks)
    end
  end

  describe "PATCH task" do
    it "update redirects to tasks" do
      create(:task, id: 1)
      patch "/tasks/1", params: { task: { todo: 'Update redirect test' } }
      expect(response).to redirect_to(:tasks)
    end
  end
end
