module Auctions
  class Creator
    extend ::Concerns::Performable

    def initialize(auction_data)
      @auction_data = auction_data
    end

    def perform
      ::Auction.create!(auction_data).tap { |auction|

        # MOVE to DelayedJob
        response = ::Classifier::Client.instance.classify_auction(auction)
        auction.update_attribute(:fraud_possibility, response == 'True')
      }
    rescue ActiveRecord::RecordNotUnique
      false
    end

    private
    attr_reader :auction_data
  end
end
