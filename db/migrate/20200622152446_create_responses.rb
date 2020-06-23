class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :username
      t.integer :confidence
      t.text :lecture
      t.text :rescue_from
      t.text :api
    end
  end
end
