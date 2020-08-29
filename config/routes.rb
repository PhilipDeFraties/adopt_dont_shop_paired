Rails.application.routes.draw do
  root 'welcome#index'

  get '/shelters',              to: 'shelters#index'
  get '/shelters/new',          to: 'shelters#new'
  get '/shelters/:id',          to: 'shelters#show'
  post '/shelters',             to: 'shelters#create'
  delete 'shelters/:id',        to: 'shelters#destroy'
  get '/shelters/:id/edit',     to: 'shelters#edit'
  patch 'shelters/:id',         to: 'shelters#update'

  get '/shelters/:id/pets',     to: 'shelterpets#index'

  get '/pets',                  to: 'pets#index'
  get '/shelters/:id/pets/new', to: 'pets#new'
  get '/pets/:id',              to: 'pets#show'
  post '/shelters/:id/pets',    to: 'pets#create'
  delete '/pets/:id',           to: 'pets#destroy'
  get '/pets/:id/edit',         to: 'pets#edit'
  patch 'pets/:id',             to: 'pets#update'

  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id/reviews', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/reviews/:id', to: 'reviews#update'
  delete '/shelters/:shelter_id/reviews/:id/delete', to: 'reviews#destroy'

  patch '/favorites/:pet_id', to: 'favorites#update'
  delete '/favorites', to: 'favorites#destroy'
  get '/favorites', to: 'favorites#index'
  delete '/favorites/:pet_id', to: 'favorites#delete'

  get '/faves_application', to: 'faves_applications#new'
end
