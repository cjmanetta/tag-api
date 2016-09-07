class EntitySerializer < ActiveModel::Serializer
	attributes :id, :entity_type, :tags

	def tags
		object.tags.pluck(:text)
	end
end