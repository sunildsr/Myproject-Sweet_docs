Rails.application.routes.draw do
   root "readings#new"
   resources :readings, only: [:new, :create]
   
   get "/reports/show_display_options"=> "reports#show_display_options"
   post "/reports/results" => "reports#results"
   


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end