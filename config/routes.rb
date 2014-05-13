TrackSnack::Application.routes.draw do
  # Spencer: I think the lessons on nested routes in week 6 may help you organize your routes. 
  root 'sites#index'
  get '/how_to_use', to: 'sites#how_to_use'
  get '/contacts', to: 'sites#contacts'
  get "/customer_orders/customer_confirm_order_view", to: 'customer_orders#customer_confirm_order_view'
  post "/customer_orders/create_order", to: 'customer_orders#create_order'
  post "/customer_orders/add_items_to_order", to: 'customer_orders#add_items_to_order'
  post "customer_orders/customer_confirmed", to: 'customer_orders#customer_confirmed'
  get '/admin', to: 'sites#admin'
  get '/vendor_login', to: 'sites#vendor_login'
  get "/vendor_todos/index"
  get "/vendor_todos/edit"
  get "/vendor_todos/show"
  post "/vendor_todos/update"
  get '/signup', to: 'users#new'
  get '/signout', to: 'sessions#destroy'
  get'/signin', to: 'sessions#new'
  resources :customer_orders
  resources :vendors
  resources :users
  resources :orders
  resources :menu_items
  resources :sessions
end

# Peters-MacBook-Pro:trackSnack petervarga$ rake routes
#                                      Prefix Verb   URI Pattern                                            Controller#Action
#                                        root GET    /                                                      sites#index
#                                  how_to_use GET    /how_to_use(.:format)                                  sites#how_to_use
#                                    contacts GET    /contacts(.:format)                                    sites#contacts
# customer_orders_customer_confirm_order_view GET    /customer_orders/customer_confirm_order_view(.:format) customer_orders#customer_confirm_order_view
#                customer_orders_create_order POST   /customer_orders/create_order(.:format)                customer_orders#create_order
#          customer_orders_add_items_to_order POST   /customer_orders/add_items_to_order(.:format)          customer_orders#add_items_to_order
#          customer_orders_customer_confirmed POST   /customer_orders/customer_confirmed(.:format)          customer_orders#customer_confirmed
#                                       admin GET    /admin(.:format)                                       sites#admin
#                                vendor_login GET    /vendor_login(.:format)                                sites#vendor_login
#                           vendor_jobs_index GET    /vendor_jobs/index(.:format)                           vendor_jobs#index
#                            vendor_jobs_show GET    /vendor_jobs/show(.:format)                            vendor_jobs#show
#                            vendor_jobs_edit GET    /vendor_jobs/edit(.:format)                            vendor_jobs#edit
#                             customer_orders GET    /customer_orders(.:format)                             customer_orders#index
#                                             POST   /customer_orders(.:format)                             customer_orders#create
#                          new_customer_order GET    /customer_orders/new(.:format)                         customer_orders#new
#                         edit_customer_order GET    /customer_orders/:id/edit(.:format)                    customer_orders#edit
#                              customer_order GET    /customer_orders/:id(.:format)                         customer_orders#show
#                                             PATCH  /customer_orders/:id(.:format)                         customer_orders#update
#                                             PUT    /customer_orders/:id(.:format)                         customer_orders#update
#                                             DELETE /customer_orders/:id(.:format)                         customer_orders#destroy
#                                     vendors GET    /vendors(.:format)                                     vendors#index
#                                             POST   /vendors(.:format)                                     vendors#create
#                                  new_vendor GET    /vendors/new(.:format)                                 vendors#new
#                                 edit_vendor GET    /vendors/:id/edit(.:format)                            vendors#edit
#                                      vendor GET    /vendors/:id(.:format)                                 vendors#show
#                                             PATCH  /vendors/:id(.:format)                                 vendors#update
#                                             PUT    /vendors/:id(.:format)                                 vendors#update
#                                             DELETE /vendors/:id(.:format)                                 vendors#destroy
#                                       users GET    /users(.:format)                                       users#index
#                                             POST   /users(.:format)                                       users#create
#                                    new_user GET    /users/new(.:format)                                   users#new
#                                   edit_user GET    /users/:id/edit(.:format)                              users#edit
#                                        user GET    /users/:id(.:format)                                   users#show
#                                             PATCH  /users/:id(.:format)                                   users#update
#                                             PUT    /users/:id(.:format)                                   users#update
#                                             DELETE /users/:id(.:format)                                   users#destroy
#                                      orders GET    /orders(.:format)                                      orders#index
#                                             POST   /orders(.:format)                                      orders#create
#                                   new_order GET    /orders/new(.:format)                                  orders#new
#                                  edit_order GET    /orders/:id/edit(.:format)                             orders#edit
#                                       order GET    /orders/:id(.:format)                                  orders#show
#                                             PATCH  /orders/:id(.:format)                                  orders#update
#                                             PUT    /orders/:id(.:format)                                  orders#update
#                                             DELETE /orders/:id(.:format)                                  orders#destroy
#                                  menu_items GET    /menu_items(.:format)                                  menu_items#index
#                                             POST   /menu_items(.:format)                                  menu_items#create
#                               new_menu_item GET    /menu_items/new(.:format)                              menu_items#new
#                              edit_menu_item GET    /menu_items/:id/edit(.:format)                         menu_items#edit
#                                   menu_item GET    /menu_items/:id(.:format)                              menu_items#show
#                                             PATCH  /menu_items/:id(.:format)                              menu_items#update
#                                             PUT    /menu_items/:id(.:format)                              menu_items#update
#                                             DELETE /menu_items/:id(.:format)                              menu_items#destroy