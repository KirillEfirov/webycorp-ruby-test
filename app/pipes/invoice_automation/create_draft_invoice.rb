# frozen_string_literal: true

module InvoiceAutomation
  # It creates a draft invoice for a given customer.
  # The invoice remains a draft until you finalize the invoice
  class CreateDraftInvoice
    def self.call(result)
      result.map do |cart|
        cart.draft_invoice = Stripe::Invoice.create({ customer: cart.user.id, auto_advance: false })
        cart
      end
    end
  end
end
