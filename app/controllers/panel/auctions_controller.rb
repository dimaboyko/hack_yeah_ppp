module Panel
  class AuctionsController < ApplicationController
    before_action :authenticate_user!

    def index
      @auctions = Auction.all
    end
  end
end
