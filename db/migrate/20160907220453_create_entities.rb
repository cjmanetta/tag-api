class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
    	t.string :entity_type
      t.timestamps
    end
  end
end
