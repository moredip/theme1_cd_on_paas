require 'multi_json'

module DealsService
  class Deal < Struct.new(:sku,:desc)
    def to_json(*args)
      MultiJson.dump(self.to_h,*args)
    end
  end

  class DecoratedDeal < Struct.new(:sku,:desc,:price)
    def self.decorate(deal,price)
      new(deal.sku,deal.desc,price)
    end

    def to_json(*args)
      hash = self.to_h
      hash['price'] = "%01.2f" % self.price
      MultiJson.dump(hash,*args)
    end
  end
end
