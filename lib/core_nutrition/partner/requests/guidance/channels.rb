module CoreNutrition
  module Partner
    module Requests
      module Guidance
        class Channels
          # Retrieve the list of records
          #
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Response]
          def self.list(params={})
            rel   = CoreNutrition::Partner::Client.rel_for('partner/rels/guidance-channels')
            route = CoreNutrition::Partner::Client.routes.find_by_rel(rel)
            url   = route.url_for(params)

            request = CoreNutrition::Partner::Client.connection.get do |req|
              req.url(url)
            end

            CoreNutrition::Partner::Response.new(request)
          end

          # Retrieve the instance of a gender
          #
          # @param id [Integer]
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Response]
          def self.retrieve(id, params={})
            raise CoreNutrition::Partner::Errors::InvalidArgumentError.new("id must be provided") if id.nil?

            rel   = CoreNutrition::Partner::Client.rel_for('partner/rels/guidance-channel')
            route = CoreNutrition::Partner::Client.routes.find_by_rel(rel)
            url   = route.url_for(params.merge!(id: id.to_s))

            request = CoreNutrition::Partner::Client.connection.get do |req|
              req.url(url)
            end

            CoreNutrition::Partner::Response.new(request)
          end
        end
      end
    end
  end
end
