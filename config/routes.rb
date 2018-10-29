Rails.application.routes.draw do
  resources :request_details
  resources :requests
  resources :master_departments
  resources :summary_cases
  resources :return_cases
  resources :data_cases
  resources :staffing_cases
  resources :sale_by_sellers, only: [:index] do
    collection do
      post 'import'
      get 'delete'
      get 'downloads'
    end
  end

  namespace :market do
    get 'dashboard/index'
  end

  get 'staff_request/show'
  get 'staff_request/index'
  post 'staff_request/request_send'
  post 'staff_request/generated'
  get 'hour_analysis/index'
  get 'dashboard/administracion'
  get 'dashboard/ventas'
  get 'dashboard/productividad'
  get 'data_master/index'

  resources :sales_statistics
  resources :rs
  resources :hs
  resources :sps

  get 'productivity_cluster/month'
  get 'productivity_cluster/json_month'

  get 'productivity/show'
  get 'productivity/index'
  get 'productivity/json_current'
  get 'productivity/report'
  get 'productivity/data_month'
  get 'productivity/report_data'
  post 'productivity/save_case'

  resources :shift_breaks
  get 'staffing/index'
  get 'staffing/show'

  # get 'assigned_shift/show'
  resources :sale_reals, only: [:index] do
    collection do
      post 'import'
      get 'delete'
      get 'downloads'
    end
  end

  resources :sales, only: [:index] do
    collection do
      get 'quarter'
      get 'week'
      get 'month'
      get 'day'
      get 'year'
      get 'season'

      get 'compare_month'
      get 'compare_month_json'

      get 'json_day'
      get 'json_week'
      get 'json_month'
      get 'json_year'
    end
  end
  # resources :staffing_reals
  resources :staffing_reals, only: [:index] do
    collection do
      get 'index'
      post 'import'
      get 'delete'
      get 'downloads'
    end
  end

  resources :sales_cluster, only: [:index] do
    collection do
      get 'quarter'
      get 'week'
      get 'month'
      get 'day'
      get 'year'
      get 'season'

      get 'compare_month'
      get 'compare_month_json'

      get 'json_day'
      get 'json_week'
      get 'json_month'
      get 'json_year'
    end
  end

  resources :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path_prefix: 'my'

  get 'dashboard/index'

  resources :sale_plans, only: [:index] do
    collection do
      post 'import'
      get 'search'
      get 'json_day'
      get 'json_week'
      get 'json_month'
      get 'json_year'
      get 'delete'
      get 'downloads'
    end
  end

  resources :historic_sales, only: [:index] do
    collection { post 'import' }
  end

  resources :available_shifts, param: :num do
    collection { post 'import'}
    collection { get 'calendar_json' }
  end

  resources :sellers do
    collection do
      get 'import_form'
      post 'import'
      get 'calendar_shift'
    end
    resources :assigned_shift, only: [:show], param: :num
  end

  resources :departments do
    collection { post 'import' }
  end

  resources :stores do
    collection { post 'import' }
  end

  authenticated :user, ->(u) { u.role == 'colaborador' } do
    root to: 'sellers#show', as: :colaborador_root
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
