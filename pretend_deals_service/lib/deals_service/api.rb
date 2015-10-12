require 'grape'

require 'deals_service/service_registry'

module DealsService
  class API < Grape::API
    format :json

    helpers ServiceRegistryMixin

    get '/deals' do
      deals_repo.deals.map{ |d| deal_decorator.decorate_deal_with_pricing(d) }
    end

    get do
      redirect "/deals"
    end
  end
end
