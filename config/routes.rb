Zuche::Application.routes.draw do


  resources :cars do
    resources :comments
  end

  get "search_infos/result"

  get "home_pages/home"

  resources :users 
  controller :profiles do
    post 'profile_update' => :update
    get 'profile' => :show
  end

  resources :infos
  
  controller :infos do
    get 'myinfo' => :myinfo

    get 'select_car' => :select_car
    post 'confirm_select_car' => :confirm_select_car

    get 'select_time' => :select_time
    post 'confirm_select_time' => :confirm_select_time
    
    get 'set_rates' => :set_rates
    post 'confirm_set_rates' => :confirm_set_rates
    
    get 'complete' => :complete
  end

  controller :search_infos do
    get 'result' => :result
    get 'search_date' => :search_date
    get 'search_info_by_city' => :search_info_by_city

  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :orders do
    post 'neworder' => :create
    get 'order' => :show
    post 'check_out' => :check_out
    get 'my_order' => :my_order
  end
  
  match '/result', to: "search_infos#result"
  controller :test_pages do
    get 'test_page' => :test_page
    get 'test_format' => :test_format
  end
  root :to => 'home_pages#home'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
