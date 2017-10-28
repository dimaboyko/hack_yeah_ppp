module Auctions
  class Creator
    extend ::Concerns::Performable

    def initialize(auction_data)
      @auction_data = auction_data
    end

    def perform
      ::Auction.create!(auction_data).tap { |auction|
        # MOVE to DelayedJob
        # klasa odpalająca pobranie z http://allegro.pl/sellerInfoFrontend/11303540/aboutSeller i zapisująca te dane do auctioneer_data

        # MOVE to DelayedJob
        # klasa odpalająca pobranie z http://allegro.pl/show_item.php?item=6993255084 i zapisująca te dane do auction_data

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
