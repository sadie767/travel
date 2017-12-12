class AddColumnReviewsRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews_ratings, :destination_id, :integer
  end
end
