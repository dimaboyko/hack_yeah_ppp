class AddAuctionProviderToAuction < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :auction_provider, :text
    add_index :auctions, [:auction_provider, :auction_uuid], unique: true
  end
end
