class Auction < ApplicationRecord
  serialize :auctioneer_data, Hash
  serialize :auction_data, Hash
end
