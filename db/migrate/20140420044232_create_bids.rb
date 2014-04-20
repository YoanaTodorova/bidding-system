class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :user_id
      t.string :auction_id
      t.timestamp :set_time
      t.float :price

      t.timestamps
    end
  end
end
