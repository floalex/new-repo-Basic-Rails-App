class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.text :description
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :summaries, :posts
  end
end
