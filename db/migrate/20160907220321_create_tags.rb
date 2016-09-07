class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
    	t.string :text
    	t.belongs_to :entity, index: true
      t.timestamps
    end
  end
end
