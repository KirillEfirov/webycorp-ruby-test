# frozen_string_literal: true

module FakeStoreApiService
  module Resources
    # Cart class represents a cart resource from the Fake Store API.
    # It defines attributes for the cart and provides methods to retrieve cart data.
    class Cart < Base
      attr_accessor :id, # rubocop:disable Naming/MethodName
                    :userId,
                    :date,
                    :products,
                    :__v,
                    :user,
                    :draft_invoice

      def self.all
        response = client.get('/carts')

        response = handle_response!(response)

        response.map { |cart_params| new(cart_params) }
      end
    end
  end
end
