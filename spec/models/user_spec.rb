require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {build(:user)}

	it 'has a valid factory' do
		expect(build(:user)).to be_valid
	end

	it 'is invalid without firstname' do
		# user = build(:user, firstname: nil)
		user.firstname = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without lastname' do
		user.lastname = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without email' do
		user.email = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without unique email' do
	end

	it 'has two tasks' do
		expect(user.tasks.length).to eq(2)
	end
	
	it 'has many tasks' do
	end


	it 'returns tasks due today' do
		task = user.tasks.first
		task.update(due_date: DateTime.now)
		expect(user.due_today.length).to eq(2)
	end

end
