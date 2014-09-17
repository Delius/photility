Rails.application.routes.draw do

resources :photo_searches, only: [:new, :index, :create]

root :to => 'photo_searches#new'

end
