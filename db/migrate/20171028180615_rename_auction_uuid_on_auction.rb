class RenameAuctionUuidOnAuction < ActiveRecord::Migration[5.1]
  def change
    rename_column :auctions, :auction_uuid, :auction_id
  end
end
