class Api::V1::TagsController < ApplicationController
	def index
		render json: Tag.where(entity_id: params[:entity_id])
	end
end