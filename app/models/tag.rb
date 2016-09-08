class Tag < ApplicationRecord
	belongs_to :entity

	def self.aggregate(tags)
		tag_counts = tags.each_with_object({}) { |tag, hash| hash[tag] ? hash[tag] += 1 : hash[tag] = 1 }

		stats = []

		tag_counts.each do |tag, count|
			tag_hash = {}
			tag_hash["tag"], tag_hash["count"] = tag, count
			stats << tag_hash
		end

		stats

	end
end
