require 'multi_json'

module CatalogService
  class Product < Struct.new(:sku,:name,:description)
    def self.from_sku_and_details(sku,details)
      new( sku, details['name'], details['description'] )
    end

    def to_json(*args)
      MultiJson.dump(self.to_h,*args)
    end
  end

  class ProductRepo
    def self.from_yaml(path)
      products = YAML.load_file(path).map do |sku,details|
        Product.from_sku_and_details(sku,details)
      end
      new(products)
    end

    def initialize(products)
      @products = products
    end

    def lookup_by_sku(sku)
      @products.find{ |p| p.sku == sku }
    end

    def all_products
      @products
    end
  end
end
