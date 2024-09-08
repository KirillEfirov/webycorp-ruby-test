# frozen_string_literal: true

module InvoiceAutomation
  # Class is responsible for creating Stripe products and associated prices for each product in a cart
  class CreateProductsWithPrices
    CURRENCY = 'usd'

    def self.call(result)
      result.map do |cart|
        cart.products.each do |product|
          pr = FakeStoreApiService::Resources::Product.get(product['productId'])

          product['product'] = Stripe::Product.create({ name: pr.title })
          product['price'] = Stripe::Price.create(
            { product: product['product'].id, unit_amount: usd_to_cents(pr.price), currency: CURRENCY }
          )
        end

        cart
      end
    end

    def self.usd_to_cents(usd)
      (usd * 100).to_i
    end
  end
end
