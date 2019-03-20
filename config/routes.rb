Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# get 'tasks' => 'tasks#index'
	# get 'tasks/new'=> 'tasks#new'
	resources :tasks, only:[:index, :new, :show, :edit, :create, :update, :destroy]
end
	