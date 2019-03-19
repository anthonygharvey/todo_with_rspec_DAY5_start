class User < ApplicationRecord
	validates :firstname, :lastname, :email, presence: true
	has_many :tasks

	def due_today
		self.tasks.select do |t|
			t.due_date.to_date == DateTime.now.to_date
		end
	end
end
