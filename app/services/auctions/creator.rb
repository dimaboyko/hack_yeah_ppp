module Auctions
  class Creator
    extend ::Concerns::Performable

    def initialize(auction_data)
      @auction_data = auction_data
    end

    def perform
      ::Auction.create!(auction_data).tap { |auction|
        # # MOVE to DelayedJob
        # # klasa odpalająca pobranie z http://allegro.pl/sellerInfoFrontend/11303540/aboutSeller i zapisująca te dane do auctioneer_data

        # auctioneer_data = ::Scarpers::Auctioneer.perform(auction.auctioneer_id)
        # auction.auctioneer_data = Hash(auction.auctioneer_data).merge(auctioneer_data)
        # auction.save

        # # MOVE to DelayedJob
        # # klasa odpalająca pobranie z http://allegro.pl/show_item.php?item=6993255084 i zapisująca te dane do auction_data

        # auction_data = ::Scarpers::Auction.perform(auction.auction_id)

        # # MOVE to DelayedJob
        # krs_data = ::Scarpers::Krs.perform(auction.auctioneer_data['company_nip'])
        # unless krs_data.empty?
        #   auction.auctioneer_data = Hash(auction.auctioneer_data).merge(krs_data)
        #   auction.save
        # end

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
