module Auctions
  class Creator
    extend ::Concerns::Performable

    def initialize(auction_data)
      @auction_data = auction_data
    end

    def perform
      ::Auction.create!(auction_data).tap { |auction|
        # MOVE to DelayedJob
        ::Classifier::Client.instance.classify_auction(auction)
      }
    rescue ActiveRecord::RecordNotUnique
      false
    end

    private
    attr_reader :auction_data
  end
end
