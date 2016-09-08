class Api::V1::EntitiesController < ApplicationController
	def stats
		tags = Tag.where(entity_id: params[:entity_id]).pluck(:text)
		render json: Tag.aggregate(tags), root: "stats"
	end
end