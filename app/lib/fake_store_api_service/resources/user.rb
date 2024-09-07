# frozen_string_literal: true

module FakeStoreApiService
  module Resources
    # User class represents a user resource from the Fake Store API.
    # It defines attributes for the user and provides methods to retrieve user data.
    class User < Base
      attr_accessor :id,
                    :address,
                    :email,
                    :username,
                    :password,
                    :name,
                    :__v

      def self.get(id)
        response = client.get("/users/#{id}")

        response = handle_response!(response)

        new(response)
      end
    end
  end
end
