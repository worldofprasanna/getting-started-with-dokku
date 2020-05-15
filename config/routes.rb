Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'health', to: 'health#check'
end
