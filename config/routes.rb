Rails.application.routes.draw do
  get 'about/author'
  get 'about', to: 'about#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
