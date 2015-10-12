require 'faraday'
require 'faraday_middleware'
require 'microscope_tracer/faraday_middleware'

module DealsService
  class PricingGateway
    def initialize(base_url)
      @conn = Faraday.new(url:base_url) do |faraday|
        faraday.use MicroscopeTracer::FaradayMiddleware, 'deals-service'
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def price_for(sku)
      # TODO: handle errors, etc
      response = @conn.get("/price/#{sku}")
      BigDecimal.new( response.body['price'] )
    end
  end
end
