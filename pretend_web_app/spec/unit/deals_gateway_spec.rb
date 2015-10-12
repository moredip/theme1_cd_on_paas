require 'spec_helper'

describe WebStore::Deal do
  subject { WebStore::Deal.new({sku: "1234", desc: "stuff", price: "14.23"}.to_json) }

  it "has sku accurately parsed" do
    expect(subject.sku).to eq("1234")
  end

  it "has desc accurately parsed" do
    expect(subject.desc).to eq("stuff")
  end

  it "has price accurately parsed" do
    expect(subject.price).to eq("14.23")
  end
end
