Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #O namespace cria um nome inicial de cada rota para mais controle (O mais importante são as rotas que se cria no resources).
  namespace :api do
    namespace :v1 do
      resources :administradors
      resources :funcionarios
      resources :fornecedores
    end
  end

end
