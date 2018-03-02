# -*- encoding : utf-8 -*-
Tmwsd::Application.routes.draw do

  devise_for :users

  resources :messages, :only => [:index, :new, :create, :update, :show] do
    resources :message_urls, :only => :create
  end

  match "/missing" => "accesses#missing", :as => "missing"

  match "/p/:action", :controller => :pages

  match "/:id/authenticate" => "accesses#authenticate", :as => "authenticate"
  match "/:id" => "accesses#show", :as => "short", :via => [:get, :post]

  root :to => "messages#new"

end
