# frozen_string_literal: true

module InvoiceAutomation
  # It associates the previously created Stripe customer and price with the invoice item.
  class CreateInvoiceItems
    def self.call(result)
      result.map do |cart|
        cart.products.each do |product|
          product['invoice_item'] = Stripe::InvoiceItem.create(
            { customer: cart.user.id, price: product['price'].id, quantity: product['quantity'] }
          )
        end

        cart
      end
    end
  end
end
