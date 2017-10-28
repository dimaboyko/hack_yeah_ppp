class AddAuctionUuidToAuctions < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :auction_uuid, :text
    add_index :auctions, :auction_uuid
    add_index :auctions, :auctioneer_id
  end
end
