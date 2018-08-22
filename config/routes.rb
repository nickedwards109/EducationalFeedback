Rails.application.routes.draw do
  get 'tutorials/:slug/feedbacks/new', to: 'tutorials/feedbacks#new'
  post 'tutorials/:slug/feedbacks/new', to: 'tutorials/feedbacks#create'
  get 'tutorials/:slug/feedbacks', to: 'tutorials/feedbacks#index'
end
