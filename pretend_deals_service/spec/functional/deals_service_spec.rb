require 'functional_spec_helper'

describe DealsService do
  it "returns deals" do
    response = Net::HTTP.get_response(URI.parse(BASE_URL + '/deals'))
    expect(response.body).to match /sweater/
  end
end
