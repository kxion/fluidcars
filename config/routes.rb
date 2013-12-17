Zuche::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post '/auth/failure' => :failure
    get '/auth/failure' => :failure
    delete 'logout' => :destroy
    post '/auth/:provider/callback' => :create
    get '/auth/:provider/callback' => :create
  end
  
  resources :users do
    collection do
      get 'profile' => :panel
      get 'main' => :main
    end
    member do
      get 'show' => :show
    end      
  end

  controller :identities do
    get 'signup' => :new
  end

  resources :rents do
    collection do
      get 'my' => :myrents

      get 'select_car' => :select_car
      post 'confirm_select_car' => :confirm_select_car

      get 'select_time' => :select_time
      post 'confirm_select_time' => :confirm_select_time
      
      get 'set_rate' => :set_rate
      post 'confirm_set_rate' => :confirm_set_rate
      
      get 'complete' => :complete
      get 'destroy' => :destroy

      get 'search_reservation' => :search_reservation
    end
  end

  resources :cars do
    collection do 
      get 'my' => :mycars
    end
    member do
      get 'complete' => :complete
      get 'upload_pictures' => :upload_pictures
    end
  end

  resources :pictures 
  
  resources :profiles do
    collection do
      post 'create_address' => :address
    end
  end

  controller :search_rents do
    get 'search_rents_by_location' => :search_rents_by_location
    get 'search_rents_by_date' => :search_rents_by_date
    get 'search_rents_by_city' => :search_rents_by_city

  end

  resources :comments

  resources :orders do
    collection do 
      get 'my' => :my_order
      get 'select_time' => :select_time
    end
    member do
      post 'checkout' => :check_out
    end
  end
  
  root :to => 'home_pages#home'


  # controller :test_pages do
  #   get 'test_page' => :test_page
  #   get 'test_format' => :test_format
  # end
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
