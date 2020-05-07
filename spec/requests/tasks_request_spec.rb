require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'GET tasks' do
    it 'returns a successful response' do
      get '/tasks'
      expect(response).to be_successful
    end
  end

  describe 'POST task' do
    it 'post redirects to tasks' do
      post '/tasks', params: { task: { todo: 'Post redirect test' } }
      expect(response).to redirect_to(:tasks)
    end
  end

  describe 'PATCH task' do
    let(:task) { create(:task) }

    it 'update redirects to tasks' do
      patch "/tasks/#{task.id}", params: { task: { todo: 'Update redirect test' } }
      expect(response).to redirect_to(:tasks)
    end
  end
end
