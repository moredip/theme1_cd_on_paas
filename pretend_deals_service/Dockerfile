FROM ruby:2.2.3-onbuild

ENV PORT 80
EXPOSE 80

ENV RACK_ENV production
ENV SERVICE_NAME  deals
ENV PRICING_SERVICE_BASE_URL http://pricing.service.consul/

CMD ["puma", "-C", "puma.rb"]
