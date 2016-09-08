require 'rails_helper'

describe 'tag api' do

	let(:entity) { FactoryGirl.create(:entity) }
	let(:tags) { FactoryGirl.create_list(:tag, 10, entity_id: entity.id) }
	let(:tag) { FactoryGirl.create(:tag, entity_id: entity.id) }

	it 'retrieves an entry' do
		tag = tags[0]
		get "/api/v1/tags/#{tag.entity.entity_type}/#{tag.entity_id}"

		json = JSON.parse(response.body)

		expect(json['entity']['tags'].length).to eq(10)
	end

	it 'creates an entity' do
		params = { text: tag.text, entity_type: tag.entity.entity_type }

		post "/api/v1/tags", params: params

		json = JSON.parse(response.body)

		expect(json['entity']['tags'][0]).to eq(tag.text)
	end
end