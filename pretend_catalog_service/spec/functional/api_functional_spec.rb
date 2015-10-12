require 'functional_spec_helper'

describe CatalogService::API do
  it "returns deals" do
    uri = URI.parse(BASE_URL + '/products')
    response = Net::HTTP.get_response(uri)
    expect(response.body).to match /sweater/
  end
end
