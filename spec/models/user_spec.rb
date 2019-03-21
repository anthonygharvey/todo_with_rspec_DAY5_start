require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {build_stubbed(:user)}
	let(:user_with_tasks) {build(:user_with_tasks)}

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
		user = create(:user)
		other_user = build(:user, email: user.email)
		other_user.valid?

		expect(other_user.errors[:email]).to include('has already been taken')
	end

	it 'has two tasks' do
		expect(user_with_tasks.tasks.length).to eq(2)
	end
	
	it 'has many tasks' do
		expect(user_with_tasks.tasks.length).to eq(2)
	end


	it 'returns tasks due today' do
		task = user_with_tasks.tasks.first

		allow(task).to receive(:due_date).and_return(DateTime.now.to_date)

		expect(user_with_tasks.due_today.length).to eq(1)
	end

end
