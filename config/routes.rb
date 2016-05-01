ActionController::Routing::Routes.draw do |map|
  




  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
#map.resources :usuarios
  map.connect '', :controller=>'site', :action => 'index'
  map.connect 'usuarios/tecnicos/:capacidad', :controller => 'usuarios', :action => 'tecnicos'
  map.connect 'usuarios/new/:tipo_usuario', :controller => 'usuarios', :action => 'new'
  map.connect 'maquinas/cliente/:cliente_id', :controller => 'maquinas', :action => 'index'
  
  map.connect 'peticions/new/:maquina', :controller => 'peticions', :action => 'new'
  map.connect 'peticions/cliente/:cliente_id', :controller => 'peticions', :action => 'index'

  map.connect 'ordens/new/:maquina_id', :controller => 'ordens', :action => 'new'

  map.connect 'ordens/agenda/:tecnico_id', :controller => 'ordens', :action => 'agenda'

  map.connect 'ayuda', :controller => 'ayuda', :action => 'index'

  map.connect 'manuales', :controller => 'manuales', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
