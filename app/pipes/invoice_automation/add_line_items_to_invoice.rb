# frozen_string_literal: true

module InvoiceAutomation
  # Attaches the corresponding invoice items to the draft invoice using the Stripe API
  class AddLineItemsToInvoice
    def self.call(result) # rubocop:disable Metrics/MethodLength
      result.map do |cart|
        cart.products.each do |product|
          invoice_item = product['invoice_item']

          cart.draft_invoice = Stripe::Invoice.add_lines(
            cart.draft_invoice.id,
            {
              lines: [
                {
                  description: invoice_item.description,
                  amount: invoice_item.amount
                },
                { invoice_item: invoice_item.id }
              ]
            }
          )
        end

        cart.draft_invoice
      end
    end
  end
end
