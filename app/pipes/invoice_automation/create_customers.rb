# frozen_string_literal: true

module InvoiceAutomation
  # It fetches user data from the FakeStore API and creates a corresponding customer in Stripe
  class CreateCustomers
    def self.call(result)
      result.map do |cart|
        user = FakeStoreApiService::Resources::User.get(cart.userId)

        cart.user = Stripe::Customer.create(
          email: user.email,
          name: "#{user.name['firstname']} #{user.name['lastname']}"
        )

        cart
      end
    end
  end
end
