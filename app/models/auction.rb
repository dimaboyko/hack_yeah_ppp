class Auction < ApplicationRecord
  serialize :auctioneer_data
  serialize :auction_data
end
