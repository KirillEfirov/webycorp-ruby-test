# frozen_string_literal: true

module InvoiceAutomation
  # It marks each invoice as complete, making it ready for sending to customers.
  class FinalizeInvoice
    def self.call(result)
      result.map do |draft_invoice|
        Stripe::Invoice.finalize_invoice(draft_invoice.id)
      end
    end
  end
end
