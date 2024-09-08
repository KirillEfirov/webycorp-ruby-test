# frozen_string_literal: true

module InvoiceAutomation
  # It serves as the first step in the invoice automation process, retrieving the data
  # necessary for further processing (such as creating customers, products, and invoices).
  class FetchCarts
    def self.call(_)
      FakeStoreApiService::Resources::Cart.all
    end
  end
end
