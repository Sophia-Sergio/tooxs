Rails.application.routes.draw do
  get 'dashboard/index'
  resources :departments
  resources :stores
  resources :staff_requests

  namespace :api do
    namespace :v1 do
      namespace :statistics do
        get :chart
        get :summary
        get :compared_sales
      end
      namespace :employees do
        get :table
        get :index
        get :staff
      end
      get 'employees/:id/calendar_shift',
        to: 'employees#calendar_shift',
        as: 'employee_calendar_shift'
      get 'employees/:id/achievements_chart',
        to: 'employees#achievements_chart',
        as: 'employee_achievements_chart'
      namespace :periods do
        get :filter_period
      end
      namespace :filters do
        get :compared_stores
      end
      namespace :shifts do
        get :employees_calendar_shifts
        get :all
      end
    end
  end

  namespace :statistics do
    get :sales
    get :hours
    get :efficiency
    get :productivity
  end

  namespace :config do
    get :plan_change
  end

  namespace :optimizer do
    get :show
  end

  resources :employees, only: [:index, :show] do
    collection do
      get :staff
      get :staff_planning
      get :departments_staff
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path_prefix: 'my'

  root 'dashboard#index'
end
