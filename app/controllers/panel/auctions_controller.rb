module Panel
  class AuctionsController < ApplicationController
    before_action :authenticate_user!

    def index
      @auctions = Auction.all
    end

    def export
      generator = Auctions::CsvGenerator.new

      send_data generator.csv_string, filename: generator.csv_file_name
    end
  end
end
