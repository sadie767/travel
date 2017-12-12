class CreateReviewsRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews_ratings do |t|
      t.column :rating, :integer
      t.column :review, :text

      t.timestamps
    end
  end
end
