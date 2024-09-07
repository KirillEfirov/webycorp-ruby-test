# frozen_string_literal: true

require 'json'

module FakeStoreApiService
  class Error < StandardError; end

  # HttpError is a custom error class for handling HTTP responses that result in errors.
  class HttpError < Error
    attr_reader :response

    def initialize(response)
      @response = response
      super("HTTP #{response.status}: #{response.body}")
    end
  end

  class ResourceNotFound < HttpError; end
  class HttpClientError < HttpError; end
  class HttpServerError < HttpError; end

  module Utils
    # The HttpErrorable module defines a method to handle HTTP responses and raise errors based on the status code.
    module HttpErrorable
      def handle_response!(response)
        case response.status
        when 200
          raise FakeStoreApiService::ResourceNotFound, response if response.body == 'null' || response.body == ''
        when 400..499
          raise FakeStoreApiService::HttpClientError, response
        when 500..599
          raise FakeStoreApiService::HttpServerError, response
        end

        JSON.parse(response.body)
      end
    end
  end
end
