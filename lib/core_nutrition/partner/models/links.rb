module CoreNutrition
  module Partner
    module Models
      class Links
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          internal_collection.each(&block)
        end

        # Find the link by its relationship
        #
        # @return [CoreNutrition::Partner::Models::Link,NilClass]
        def find_by_rel(rel)
          self.find { |record| record.rel == rel }
        end

        # Find the link by its delationship
        #
        # @raises [CoreNutrition::Partner::Errors::LinkNotFoundError]
        #
        # @return [CoreNutrition::Partner::Models::Link]
        def find_by_rel!(rel)
          record = self.find_by_rel(rel)

          raise CoreNutrition::Partner::Errors::LinkNotFoundError.new("Could not find link with rel `%s`" % [rel]) if record.nil?

          record
        end

        private
        def internal_collection
          @collection.map { |record| CoreNutrition::Partner::Models::Link.new(record) }
        end
      end
    end
  end
end
