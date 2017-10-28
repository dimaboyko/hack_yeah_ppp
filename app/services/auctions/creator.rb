module Auctions
  class Creator
    extend ::Concerns::Performable

    def initialize(auction_data)
      @auction_data = auction_data
    end

    def perform
      Auction.create(auction_data)
    end

    private
    attr_reader :auction_data
  end
end
