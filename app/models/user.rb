class User < ApplicationRecord
	validates :firstname, :lastname, :email, presence: true
	has_many :tasks
	validates_uniqueness_of :email

	def due_today
		self.tasks.select do |t|
			t.due_date.to_date == DateTime.now.to_date
		end
	end
end
