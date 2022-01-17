module CoreNutrition
  module Partner
    module Requests
      class Directory

        def self.retrieve(params={})
          root_url = '/partner'
          request  = CoreNutrition::Partner::Client.connection.get do |req|
            req.url(root_url)
          end

          CoreNutrition::Partner::Response.new(request)
        end
      end
    end
  end
end
