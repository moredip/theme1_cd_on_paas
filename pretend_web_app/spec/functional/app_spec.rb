require 'functional_spec_helper'

describe WebStore::App do
  it "returns deals" do
    uri = URI.parse(BASE_URL)
    response = Net::HTTP.get_response(uri)
    expect(response.body).to match /Some Deals/
  end
end
