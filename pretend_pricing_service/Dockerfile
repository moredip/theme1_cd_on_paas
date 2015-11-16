FROM ruby:2.2.3-onbuild

ENV PORT 80
EXPOSE 80

ENV RACK_ENV      production
ENV SERVICE_NAME  pricing
ENV DATABASE_URL  postgres://postgres@db/postgres

CMD ["puma", "-C", "puma.rb"]
