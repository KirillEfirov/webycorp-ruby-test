# frozen_string_literal: true

module FakeStoreApiService
  # The Client class handles API requests to the Fake Store API.
  class Client
    BASE_URL = 'https://fakestoreapi.com'

    def get(path)
      Application.logger.info("Making GET request to: #{BASE_URL}#{path}")

      response = connection.get do |req|
        req.url(path)
      end

      Application.logger.info("Received response: #{response.status} - #{response.body}")

      response
    rescue Faraday::Error => e
      Application.logger.error("Request failed: #{e.message}")
      raise
    end

    private

    def connection
      Faraday.new(BASE_URL) do |conn|
        conn.headers['Content-Type'] = 'application/json'
        conn.options.timeout = 30
      end
    end
  end
end
