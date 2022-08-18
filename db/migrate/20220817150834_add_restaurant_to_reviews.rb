class AddRestaurantToReviews < ActiveRecord::Migration[7.0]
  def change
    #console rails: ✗ rails generate migration AddRestaurantToReviews restaurant:references
    add_reference :reviews, :restaurant, null: false, foreign_key: true
  end
end
