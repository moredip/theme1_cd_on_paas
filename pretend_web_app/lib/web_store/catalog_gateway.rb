require 'faraday'
require 'faraday_middleware'
require 'microscope_tracer/faraday_middleware'
require 'json'

require 'web_store/product'

module WebStore
  class CatalogGateway
    def self.for_env(env=ENV)
      if ENV['VCAP_SERVICES']
        vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
        catalog_service_base_url = vcap_services['user-provided'].detect { |service| service["credentials"]["type"] == 'catalog' }["credentials"]["url"]
      else
        catalog_service_base_url = env.fetch('CATALOG_SERVICE_BASE_URL')
      end
      new(catalog_service_base_url)
    end

    def initialize(base_url)
      @conn = Faraday.new(url:base_url) do |faraday|
        faraday.use MicroscopeTracer::FaradayMiddleware, $MICROSCOPE_SERVICE_NAME
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def all_products
      # TODO: handle errors, etc
      response = @conn.get("/products")
      response.body.map{ |json| Product.new(json) }
    end

    def lookup_by_sku(sku)
      # TODO: handle errors, etc
      response = @conn.get("/products/#{sku}")
      Product.new(response.body)
    end
  end
end
