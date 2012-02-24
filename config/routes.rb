Redbrew::Application.routes.draw do
  resources :plugins
  root :to => 'plugins#index'
  #match ':controller(/:action(/:id))(.:format)'
end
