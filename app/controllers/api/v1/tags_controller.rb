class Api::V1::TagsController < ApplicationController
	def index
		render json: Entity.find(params[:entity_id])
	end
end