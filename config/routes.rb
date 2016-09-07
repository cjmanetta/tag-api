Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
  	namespace :v1 do
  		get '/tags/:entity_type/:entity_id', to: 'tags#index'
  	end
  end
end
