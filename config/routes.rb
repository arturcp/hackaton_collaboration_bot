Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: 'json' do
    resource :point, only: :create
  end

  get 'dashboard', to: 'dashboard#index'
  get 'admin', to: 'admin#index'
  delete 'admin', to: 'admin#destroy', as: 'restart_house_cup'
end
