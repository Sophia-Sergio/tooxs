Rails.application.routes.draw do
  
  get 'dashboard/administracion'
  get 'dashboard/ventas'
  get 'dashboard/productividad'

  resources :sales_statistics  
  resources :rs
  resources :hs
  resources :sps

  get 'productivity/show'
  get 'productivity/json_current'

  resources :shift_breaks
  get 'staffing/index'
  get 'staffing/show'


  #get 'assigned_shift/show'

  resources :sale_reals, only: [:index] do
    collection { 
      post 'import'
      }
  end

  resources :sales, only: [:index] do 
    collection {
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

    }
  end

  resources :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }, path_prefix: 'my'



  get 'dashboard/index'

  resources :sale_plans, only: [:index] do
    collection { 
      post 'import'
      get 'search'
      get 'json_day'
      get 'json_week'
      get 'json_month'
      get 'json_year'
      }
  end

  resources :historic_sales, only: [:index] do
    collection { post 'import' }
  end

  resources :available_shifts, param: :num do
    collection { post 'import'}
    collection { get 'calendar_json' }
  end
  
  resources :sellers do
    collection { 
      get 'import_form'
      post 'import'
      get 'calendar_shift'
    }
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
