require 'rails_helper'

describe 'tag api' do

	let(:entity) { FactoryGirl.create(:entity) }
	let(:tags) { FactoryGirl.create_list(:tag, 10, entity_id: entity.id) }

	it 'retrieves an entry' do
		tag = tags[0]
		get "/api/v1/tags/#{tag.entity.entity_type}/#{tag.entity_id}"
		# binding.pry
		json = JSON.parse(response.body)

		expect(json['tags'].length).to eq(10)
	end
end