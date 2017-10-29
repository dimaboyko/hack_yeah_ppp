require 'csv'
module Auctions
  class CsvGenerator

    def csv_string
      CSV.generate(force_quotes: false, col_sep: ';') { |csv|
        csv << csv_header
        frauded_auctions.each do |auction|

          csv << build_row(auction)
        end
      }
    end

    def csv_file_name
      "raport-fraud-posibility-#{SecureRandom.hex(4)}.csv"
    end

    private

    def csv_header
      [
        '#nick',
        'nip',
        'email',
        'phone'
      ]
    end

    def build_row(auction)
      nick = auction.auctioneer_data['nick'].to_s.sub(/[^a-zA-Z0-9._-]+/, ''),
      clean_nip = auction.auctioneer_data['company_nip'].to_s.gsub(/[^0-9]/, '')

      emails = Array(auction.auctioneer_data['emails']).select { |email|
        email.present? && ::Regexp.new(/(^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]+$)/).match?(email.to_s)
      }

      phones = Array(auction.auctioneer_data['phones']).map { |phone|
        phone.present? &&  phone.to_s.sub("+48", "")
      }.select { |phone|
        ::Regexp.new(/^\d{9,11}$/).match?(phone.to_s)
      }

      [
        nick.class,
        clean_nip.class,
        emails.join(',').class,
        phones.join(',').class
      ]
    end

    def frauded_auctions
      Auction.where(fraud_possibility: true).uniq(&:auctioneer_id)
    end
  end
end
