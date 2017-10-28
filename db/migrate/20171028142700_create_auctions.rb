class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.integer :auctioneer_id
      t.text :auctioneer_data
      t.text :auction_data

      t.timestamps
    end
  end
end
