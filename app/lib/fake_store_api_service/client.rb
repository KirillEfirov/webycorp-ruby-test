# frozen_string_literal: true

module FakeStoreApiService
  # The Client class handles API requests to the Fake Store API.
  class Client
    BASE_URL = 'https://fakestoreapi.com'

    def get(path)
      connection.get do |req|
        req.url(path)
      end
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
