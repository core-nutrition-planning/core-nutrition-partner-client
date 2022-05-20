module CoreNutrition
  module Partner
    module Requests
      module Guidance
        class NutritionTargetings
          # Create the Nutrition Target
          #
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Response]
          def self.create(params={})
            rel   = CoreNutrition::Partner::Client.rel_for('partner/rels/guidance-nutrition-targeting')
            route = CoreNutrition::Partner::Client.routes.find_by_rel(rel)
            url   = route.url_for

            request_attributes = {
              :nutrition_targeting => params
            }

            request = CoreNutrition::Partner::Client.connection.post do |req|
              req.url(url)
              req.headers['Content-Type'] = 'application/json'
              req.body = MultiJson.dump(request_attributes)
            end

            CoreNutrition::Partner::Response.new(request)
          end

          # Create the Nutrition Target Summary
          #
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Response]
          def self.summary(params={})
            rel   = CoreNutrition::Partner::Client.rel_for('partner/rels/guidance-nutrition-targeting-summary')
            route = CoreNutrition::Partner::Client.routes.find_by_rel(rel)
            url   = route.url_for

            request_attributes = {
              :nutrition_targeting => params
            }

            request = CoreNutrition::Partner::Client.connection.post do |req|
              req.url(url)
              req.headers['Content-Type'] = 'application/json'
              req.body = MultiJson.dump(request_attributes)
            end

            CoreNutrition::Partner::Response.new(request)
          end

          # Create the Nutrition Target Products
          #
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Response]
          def self.products(params={})
            rel   = CoreNutrition::Partner::Client.rel_for('partner/rels/guidance-nutrition-targeting-products')
            route = CoreNutrition::Partner::Client.routes.find_by_rel(rel)
            url   = route.url_for

            request_attributes = {
              :nutrition_targeting => params
            }

            request = CoreNutrition::Partner::Client.connection.post do |req|
              req.url(url)
              req.headers['Content-Type'] = 'application/json'
              req.body = MultiJson.dump(request_attributes)
            end

            CoreNutrition::Partner::Response.new(request)
          end
        end
      end
    end
  end
end
