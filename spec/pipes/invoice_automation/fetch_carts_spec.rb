# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceAutomation::FetchCarts do
  subject(:fetch_carts) { described_class.call([]) }

  it 'fetches carts from the Fake Store API', vcr: { cassette_name: 'fetch_carts' } do
    expect(fetch_carts).to be_an(Array)
  end
end
