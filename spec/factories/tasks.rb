FactoryBot.define do
	factory :homework, class: Task do
		association :user
		name "complete homework"
		due_date { DateTime.now + 2.days }
		priority 1
	end

	factory :email, class: Task do
		association :user
		name "reply to Zack's email"
		due_date { DateTime.now }
		priority 2
	end

	# factory :invalid_taks, class: Task do
	# 	name nil
	# 	priority nil
	# end

  factory :task do
    name "buy beer"
    priority 2

		factory :vote do
			association :user
      name 'vote'
			priority 1
			due_date { DateTime.now + 3.days }
    end

    factory :invalid_task do
      name nil
      priority nil
    end
  end
end
