Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/show" => "posts#show"

  post "posts/yes" => "posts#yes"
  post "posts/no" => "posts#no"

  post "posts/stop" => "posts#stop"
  post "posts/start" => "posts#start"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

