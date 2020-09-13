Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #O namespace cria um nome inicial de cada rota para mais controle (O mais importante são as rotas que se cria no resources).
  namespace :api do
    namespace :v1 do
      resources :administradors
      resources :tokens
      resources :funcionarios
      resources :fornecedores
      resources :produtos
      resources :empresas
      resources :clientes
      resources :pagamentos
      resources :vendas

      post '/funcionario/logar', to: 'funcionarios#login'

      post '/administrador/logar', to: 'administradors#login'
      
    end
  end

  match '/api/v1/funcionario/logar', to: 'application#options', via: :options
  
  match '/api/v1/administrador/logar', to: 'application#options', via: :options
  
  match '/api/v1/empresas/', to: 'application#options', via: :options
end
