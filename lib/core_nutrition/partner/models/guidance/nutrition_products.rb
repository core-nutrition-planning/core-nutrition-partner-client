module CoreNutrition
  module Partner
    module Models
      module Guidance
        class NutritionProducts
          include Enumerable

          def initialize(collection)
            @collection = Array(collection)
          end

          def each(&block)
            internal_collection.each(&block)
          end

          # Returns the collection serialized as an array
          #
          # @return [Array]
          def to_a
            self.map(&:to_a)
          end

          def to_option
            self.map(&:to_option)
          end
          alias to_options to_option
          alias options to_option

          private
          def internal_collection
            @collection.map { |record| CoreNutrition::Partner::Models::Guidance::NutritionProduct.new(record) }
          end
        end
      end
    end

  end
end
