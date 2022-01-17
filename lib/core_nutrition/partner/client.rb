require 'dotenv'
Dotenv.load

require 'logger'
require 'date'
require 'timezone'
require 'multi_json'
require 'restless_router'
require 'core_nutrition/partner/client/version'

require 'core_nutrition/partner/errors'
require 'core_nutrition/partner/logger'
require 'core_nutrition/partner/configuration'
require 'core_nutrition/partner/connection'
require 'core_nutrition/partner/response'

require 'core_nutrition/partner/utilities'

require "core_nutrition/partner/requests"
require "core_nutrition/partner/models"

module CoreNutrition
  module Partner
    module Client
      # Class accessor methods to be utilized
      # throughout the gem itself.
      class << self
        attr_accessor :configuration
        attr_accessor :routes
      end

      # Create a default Configuration to use
      # throughout the gem
      #
      # @return [CoreNutrition::Partner::Configuration] Configuration object utilizing the Default
      def self.configuration
        @configuration ||= CoreNutrition::Partner::Configuration.new
      end

      # Specify configuration options. This will be applied to
      # our memoized Configuration.
      #
      # @return [CoreNutrition::Partner::Configuration]
      def self.configure
        yield(self.configuration)
      end

      # Helper method to access the Connection object
      #
      # @return [CoreNutrition::Partner::Connection] Faraday Response Delegator
      def self.connection
        @connection ||= CoreNutrition::Partner::Connection.new(url: self.configuration.api_host) do |builder|
          builder.response(:json, content_type: /\bjson/)

          builder.response(:logger, self.configuration.request_logger)

          builder.adapter(CoreNutrition::Partner::Connection.default_adapter)
        end

        # Inject Authorization
        @connection.headers['Authorization'] = ("Bearer %s" % [self.configuration.access_token])

        # Merge default headers
        @connection.headers.merge!(self.configuration.connection_options[:headers])

        @connection
      end

      # Helper method to peform a GET request
      #
      # @return [CoreNutrition::Partner::Response] Faraday Response Delegator
      def self.get(url, data={}, headers={})
        request = self.connection.get(url, data, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      # Helper method to perform a HEAD request
      #
      # @return [CoreNutrition::Partner::Response] Faraday Response Delegator
      def self.head(url, data={}, headers={})
        request = self.connection.head(url, data, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      # Helper method to perform a OPTIONS request
      #
      # @return [CoreNutrition::Partner::Response] Faraday Response Delegator
      def self.options(url, headers={})
        request = self.connection.http_options(url, nil, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      # Helper method to perform a PUT request
      #
      # @return [CoreNutrition::Partner::Response] Faraday Response Delegator
      def self.put(url, data={}, headers={})
        request = self.connection.put(url, data, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      # Helper method to perform a POST request
      #
      # @return [CoreNutrition::Partner::Response] Faraday Response Delegator
      def self.post(url, data={}, headers={})
        request = self.connection.post(url, data, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      def self.delete(url, data={}, headers={})
        request = self.connection.delete(url, data, headers)

        CoreNutrition::Partner::Response.new(request)
      end

      # Returns the root directory response
      #
      # @return [CoreNutrition::Partner::Models::Directory]
      def self.directory
        @directory ||= CoreNutrition::Partner::Models::Directory.retrieve
      end

      # Define the API routes
      #
      # These are the endpoints that will be used to interact
      # with the API. Before you make any requests you will
      # want to add the corresponding routes here.
      #
      # @return [RestlessRouter::Routes] A collection of Routes
      def self.routes
        return @routes if @routes

        @routes = self.directory.links

        @routes
      end

      # Returns the link relationship for
      # a specified path.
      #
      # Custom link relationships are fully qualified
      # URIS, but in this case we only care to reference
      # the path and add the API host.
      #
      # @return [String]
      def self.rel_for(rel)
        "%s/%s" % [self.api_host, rel]
      end

      # Helper method to return the API HOST
      #
      # @return [String] API URI
      def self.api_host
        self.configuration.api_host
      end

      # Returns the client id ENV
      #
      # @Return [String,NilClass]
      def self.client_id
        ENV['CORE_CLIENT_ID']
      end

      # Returns the client secret ENV
      #
      # @return [String,NilClass]
      def self.client_secret
        ENV['CORE_CLIENT_SECRET']
      end
    end
  end


end
