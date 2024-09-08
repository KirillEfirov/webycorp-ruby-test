# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceAutomationProcess do
  subject(:invoice_automation_process) { described_class.call }

  it 'executes the invoice automation pipeline', vcr: { cassette_name: 'invoice_automation_process' } do
    expect(invoice_automation_process.count).to be > 0
  end
end
