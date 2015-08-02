class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :winner, index: true, null: false
      t.references :loser, index: true, null: false
      t.timestamp :occured_at, index: true, null: false

      t.timestamps null: false
    end
  end
end
