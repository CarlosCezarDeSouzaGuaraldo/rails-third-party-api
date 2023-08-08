Rails.application.routes.draw do
  get 'pages/api/:id', to: 'pages#api'
end
