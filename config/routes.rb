Rails.application.routes.draw do
  get 'config/change_plan'
  post 'config/filter_parameters'

  resources :request_details
  resources :requests
  resources :master_departments
  resources :summary_cases
  resources :return_cases
  resources :data_cases
  resources :staffing_cases
  resources :hour_analysis
  resources :sale_by_sellers, only: [:index] do
    collection do
      post 'import'
      get 'delete'
      get 'downloads'
    end
  end
  get '/efficiency/report'
  get 'efficiency/index'

  namespace :tottus do
    get 'dashboard/index'
    get 'dashboard/production'
  end

  namespace :sodimac do
    get 'dashboard/index'
  end

  get 'efficiency/index'
  post 'efficiency/report_post'
  get 'staff_request/show'
  get 'staff_request/index'
  post 'staff_request/request_send'
  post 'staff_request/generated'
  get 'hour_analysis/index'
  get 'dashboard/administracion'
  get 'dashboard/ventas'
  get 'dashboard/productividad'
  get 'data_master/index'

  namespace :api do
    namespace :v1 do
      namespace :statistics do
        get 'graph'
        get 'summary'
      end
      namespace :employees do
        get 'table'
      end
    end
  end

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
  resources :real_sales, only: [:index] do
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

  resources :sale_reals, only: [:index]

  resources :historic_sales, only: [:index] do
    collection { post 'import' }
  end

  resources :available_shifts, param: :num do
    collection { post 'import'}
    collection { get 'calendar_json' }
  end

  resources :sellers do
    collection do
      get 'staff'
      get 'import_form'
      post 'import'
      get 'calendar_shift'
      get 'staffing_store'
    end
    resources :assigned_shift, only: [:show], param: :num
  end

  resources :departments do
    collection { post 'import' }
  end

  resources :stores do
    collection { post 'import' }
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
