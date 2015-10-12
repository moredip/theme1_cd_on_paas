require 'deals_service/deal'

module DealsService
  class DealDecorator
    def initialize(pricing_gateway)
      @pricing_gateway = pricing_gateway
    end

    def decorate_deal_with_pricing(deal)
      # TODO: handle errors
      price = @pricing_gateway.price_for(deal.sku)
      DecoratedDeal.decorate(deal,price)
    end
  end
end
