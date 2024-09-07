# frozen_string_literal: true

module FakeStoreApiService
  module Resources
    # Product class represents a product resource from the Fake Store API.
    # It defines attributes for the product and provides methods to retrieve product data.
    class Product < Base
      attr_accessor :id,
                    :title,
                    :price,
                    :description,
                    :category,
                    :image,
                    :rating

      def self.get(id)
        response = client.get("/products/#{id}")

        response = handle_response!(response)

        new(response)
      end
    end
  end
end
