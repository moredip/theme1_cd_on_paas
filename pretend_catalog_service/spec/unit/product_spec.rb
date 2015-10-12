require 'spec_helper'

describe CatalogService::Product do
  describe ".from_sku_and_details" do
    subject { CatalogService::Product.from_sku_and_details "1234", {"name" => "foo", "description" => "bar"} }

    it "sets the sku correctly" do
      expect(subject.sku).to eq("1234")
    end

    it "sets the name correctly" do
      expect(subject.name).to eq("foo")
    end

    it "sets the description correctly" do
      expect(subject.description).to eq("bar")
    end
  end
end
