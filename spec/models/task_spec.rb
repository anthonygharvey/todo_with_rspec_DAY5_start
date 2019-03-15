require 'rails_helper'

RSpec.describe Task, type: :model do
	it 'has a valid homework factory' do
		expect(FactoryBot.build(:homework)).to be_valid
	end

	it "has a valid factory" do
		task = create(:email)
    expect(task).to be_valid
  end

  it 'is valid with valid attributes' do
    task = create(:vote)
    expect(task).to be_valid
  end

	it 'is invalid without name' do
    task = build(:homework, name: nil)
    expect(task).not_to be_valid
  end

  it 'is invalid without priority' do
    task = build(:email, priority: nil)
    expect(task).not_to be_valid
  end
end
