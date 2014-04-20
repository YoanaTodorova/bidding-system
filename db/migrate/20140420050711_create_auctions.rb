class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :item_id
      t.string :winning_user
      t.float :winning_price
      t.string :status #active, won, expired; active -> winning* is nil; won -> * is not nil; expired(and not won) -> winning* is nil

      t.timestamps
    end
  end
end
