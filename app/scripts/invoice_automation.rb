# frozen_string_literal: true

# InvoiceAutomation is a class responsible for automating the process
# of creating invoices from carts using a pipeline pattern.
class InvoiceAutomationProcess
  def self.call
    Pipe.new do |pipe|
      pipe.step InvoiceAutomation::FetchCarts
      pipe.step InvoiceAutomation::CreateCustomers
      pipe.step InvoiceAutomation::CreateProductsWithPrices
      pipe.step InvoiceAutomation::CreateInvoiceItems
      pipe.step InvoiceAutomation::CreateDraftInvoice
      pipe.step InvoiceAutomation::AddLineItemsToInvoice
      pipe.step InvoiceAutomation::FinalizeInvoice
    end.run
  end
end

# InvoiceAutomationProcess.call
