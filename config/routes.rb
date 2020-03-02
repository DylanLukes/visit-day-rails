Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"

    namespace :admin do
      get 'home'
    end
    
    resources :people do
      resources :schedule_items do
        delete 'attendee/:attendee_id', to: "schedule_items#remove_attendee", as: "remove_attendee"
        post 'attendee/:attendee_id', to: "schedule_items#add_attendee", as: "add_attendee"
      end
    end

    scope :schedule do
      get 'global', to: "schedule#global", as: "global_schedule"
      get ':person', to: "schedule#for_person", as: "schedule"
    end

  end
end
