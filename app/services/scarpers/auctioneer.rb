module Scarpers
  class Auctioneer
    extend ::Concerns::Performable

    def initialize(auctioneer_id)
      @auctioneer_id = auctioneer_id
    end

    def perform
      return {} if auctioneer_id.nil?

      document_data = client.fetch_auctioneer_data(auctioneer_id)
      auctioneer_company_data = document_data.at_css('#sellerUserData')
      auctioneer_contact_data = document_data.at_css('#sellerInfoContactInfo')

      {}.tap { |hash_data|
        hash_data.merge!(company_data_from(auctioneer_company_data))
        hash_data.merge!(contact_data_from(auctioneer_contact_data))
      }
    end

    private

    attr_reader :auctioneer_id

    def company_data_from(auctioneer_company_data)
      {
        company_name: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-cname').first.children
        ),
        company_city: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-city').first.children
        ),
        company_street: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-street').first.children
        ),
        company_nip: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-nip').first.children
        ),
        company_regon: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-regon').first.children
        ),
        company_krs: sanitizer_html_from(
          auctioneer_company_data.css('div.seller-user-krs').first.children
        )
      }
    end

    def contact_data_from(auctioneer_contact_data)
      {
        # phone: sanitizer_html_from(
        #   auctioneer_contact_data.css('ul.multicontact').first.children
        # ),
        # email: sanitizer_html_from(
        #   auctioneer_contact_data.css('a.seller-contact-mail').first.children
        # )
      }
    end

    def sanitizer_html_from(data)
      ActionView::Base.full_sanitizer.sanitize(data.to_s)
    end

    def client
      @client ||= ::External::AllegroWeb::Client.instance
    end
  end
end
