# frozen_string_literal: true

require_relative '../utils/http_errorable'

module FakeStoreApiService
  module Resources
    # Provides common functionality for resource classes, including
    # initialization with attributes and access to the HTTP client.
    class Base
      extend FakeStoreApiService::Utils::HttpErrorable

      def initialize(attrs = {})
        attrs.each do |key, value|
          send(:"#{key}=", value) if respond_to?(:"#{key}=")
        end
      end

      def self.client
        FakeStoreApiService::Client.new
      end
    end
  end
end
