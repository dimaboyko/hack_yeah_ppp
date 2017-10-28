module Api
  module V1
    class AuctionsController < BaseController
      def create
        if ::Auctions::Creator.perform(auction_params)
          render json: {}, status: :created
        else
          render json: {}, status: :unprocessable_entity
        end
      end

      private

      def auction_params
        params.require(:auction).permit(
          :auctioneer_id, :auction_uuid,
          :auctioneer_data => {}, auction_data: {}
        )
      end
    end
  end
end
