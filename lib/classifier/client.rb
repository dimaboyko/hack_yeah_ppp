module Classifier
  class RequestFailed < StandardError; end
  class TimeoutConnectionError < StandardError; end

  class Client
    include Singleton

    def classify_auction(auction)
      post('classify', auction.attributes)
    end

    private

    delegate :host, :api_key, to: :config, prefix: true

    def post(path, hash_data)
      request(:post, path, body: hash_data.to_json)
    rescue ::Excon::Errors::SocketError, ::AccountantPanel::RequestFailed
      nil
    end

    def request(method, path, query: {}, body: "")
      response = connection.request(
        method: method, path: path, query: query, body: body
      ).tap { |resp|
        raise ::Classifier::RequestFailed.new(
          "status: #{resp.status}, path: #{path}, query: #{query}, body: #{body}"
        ) unless [200, 201].include?(resp.status)
      }

      JSON.parse(response.body)
    rescue ::Excon::Errors::Timeout
      raise TimeoutConnectionError.new
    end

    def connection
      Excon.new(config_host, headers: headers)
    end

    def headers
      {
        "Content-Type" => "application/json",
        "x-classifier-key" => config_api_key
      }
    end

    def config
      @config ||= ::A9n.classifier
    end
  end
end
