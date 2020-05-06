require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with valid attributes" do
    expect(create(:task)).to be_valid
  end

  it "is not valid with nil todo" do
    expect(create(:task, todo: nil)).to_not be_valid
  end

  it "is not valid with empty todo" do
    expect(create(:task, todo: ' ')).to_not be_valid
  end

  it "is not valid without important" do
    expect(create(:task, important: nil)).to_not be_valid
  end

  it "is not valid without done" do
    expect(create(:task, done: nil)).to_not be_valid
  end
end
