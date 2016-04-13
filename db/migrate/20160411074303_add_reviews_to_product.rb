class AddReviewsToProduct < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.references :product, index: true
    end
    add_foreign_key :reviews, :products
  end
end
