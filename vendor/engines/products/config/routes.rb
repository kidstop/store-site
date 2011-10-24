::Refinery::Application.routes.draw do
  
  match "products/category/clearance" => "products#clearance"
  match "products/category/:category" => "products#category"
  
  resources :products, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
