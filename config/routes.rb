Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :members, only: [:create, :update, :show]

    post :visits, to: 'members#create_visit'
    get :search_members, to: 'members#search_members'
    get :query, to: 'members#query'
  end
end
