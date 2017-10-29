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

    def request_control
      permitted_params = params.require(:report).permit(:auction_id, :full_description)

      ReportMailer.report(permitted_params[:auction_id], permitted_params[:full_description], current_user).deliver_now

      logger.info([current_user.id, permitted_params[:auction_id]])
    end

    def stats; end

    def logger
      @logger ||= Logger.new("#{Rails.root}/log/monitoring.log")
    end
  end
end
