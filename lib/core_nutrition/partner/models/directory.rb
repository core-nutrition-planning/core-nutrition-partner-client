module CoreNutrition
  module Partner
    module Models
      class Directory
        # Create an instance of the Directory domain model
        #
        # @param attributes [Hash]
        #
        # @return [CoreNutrition::Partner::Models::Directory]
        def initialize(attributes={})
          @attributes = attributes
        end

        # Helper method to retrieve the directory
        #
        # @param params [Attributes] Request params
        #
        # @return [CoreNutrition::Partner::Models::Directory]
        def self.retrieve(params={})
          request = CoreNutrition::Partner::Requests::Directory.retrieve(params)

          klass_attributes = {}

          request.on(:success) do |resp|
            response_body = resp.body
            response_data = response_body.fetch('data', {})

            klass_attributes = response_data
          end

          request.on(:failure) do |resp|
            CoreNutrition::Partner::Client.configuration.logger.info { ("Failure retrieving the directory: %s" % [resp.status]) }
          end

          self.new(klass_attributes)
        end

        # Returns the title
        #
        # @return [String]
        def title
          @attributes['title']
        end

        # Returns the description
        #
        # @return [String]
        def description
          @attributes['description']
        end

        # Returns the version
        #
        # @return [String]
        def version
          @attributes['version']
        end

        # Returns the links attributes
        #
        # @return [Array]
        def links_attributes
          @attributes.fetch('links', [])
        end

        # Returns the Links
        #
        # @return [CoreNutrition::Partner::Models::Links]
        def links
          @links ||= CoreNutrition::Partner::Models::Links.new(self.links_attributes)
        end

        # Returns true if there are any links
        #
        # @return [Boolean]
        def links?
          self.links.any?
        end
      end
    end
  end
end
