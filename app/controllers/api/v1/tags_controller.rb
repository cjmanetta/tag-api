class Api::V1::TagsController < ApplicationController
	def index
		render json: Entity.find(params[:entity_id])
	end

	def create
		tag = create_tag_with_entity
		render json: tag.entity
	end

	private

	def tag_params
		params.permit(:text, :entity_type)
	end

	def create_tag_with_entity
		params = tag_params	
		entity = Entity.find_by(entity_type: params[:entity_type])
		
		if entity
			entity.tags.destroy_all
			Tag.create(entity_id: entity.id, text: params[:text])
		else
			entity = Entity.create(entity_type: params[:entity_type])
			Tag.create(entity_id: entity.id, text: params[:text])
		end
	end

end