Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: 'json' do
    resource :point, only: [:create, :destroy]
  end

  get 'dashboard', to: 'dashboard#index'
end
