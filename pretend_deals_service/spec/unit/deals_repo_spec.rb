require 'spec_helper'

describe DealsService::DealsRepo do
  it "has a sweater" do
    expect(subject.deals.find_index {|deal| deal.sku == "sweater"}).to_not be_nil
  end
end
