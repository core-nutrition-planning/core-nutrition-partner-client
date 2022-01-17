module CoreNutrition
  module Partner
    module Models
      class AthleteLevelType
        include Comparable

        # Returns an instance of the Athlete Level Type
        #
        # @param attributes [Hash]
        #
        # @return [CoreNutrition::Partner::Models::AthleteLevelType]
        def initialize(attributes={})
          @attributes = attributes
        end

        # Returns the ID
        #
        # @return [Integer]
        def id
          @attributes['id']
        end

        def name
          @attributes['name']
        end

        def label
          @attributes['label']
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

        # Returns the record as an array
        #
        # @return [Array]
        def to_a
          [self.id, self.name]
        end

        def to_attributes
          @attributes
        end

        def to_option
          [self.name, self.id]
        end
      end
    end
  end
end
