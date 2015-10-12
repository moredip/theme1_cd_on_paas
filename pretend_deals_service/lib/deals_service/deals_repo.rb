require 'deals_service/deal'

module DealsService
  class DealsRepo
    def deals
      [
        Deal.new('sweater','Warm up the winter months!'),
        Deal.new('jumpsuit','The 80s are BACK!'),
        Deal.new('tshirt','Buy 3, get 1 free!')
      ]
    end
  end
end
