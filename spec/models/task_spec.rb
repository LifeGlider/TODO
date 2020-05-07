require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  it "is valid with valid attributes" do
    expect(task).to be_valid
  end

  it "is not valid with nil 'todo'" do
    task.todo = nil
    expect(task).to_not be_valid
  end

  it "is not valid with empty 'todo'" do
    task.todo = ''
    expect(task).to_not be_valid
  end

  it "is not valid without 'important'" do
    task.important = nil
    expect(task).to_not be_valid
  end

  it "is not valid without 'done'" do
    task.done = nil
    expect(task).to_not be_valid
  end
end
