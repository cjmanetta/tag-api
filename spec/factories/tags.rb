FactoryGirl.define do
  factory :tag do
    text "Yellow"
    association :entity, entity_id: 1
  end
end