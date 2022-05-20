module CoreNutrition
  module Partner
    module Models
      module Guidance
        class CarbohydratesTarget
          include Comparable

          def initialize(attributes={})
            @attributes = attributes
          end

          def hourly_amount
            @attributes['hourly_amount']
          end

          def hourly_unit_attributes
            @attributes.fetch('hourly_unit', {})
          end

          def hourly_unit
            @hourly_unit ||= CoreNutrition::Partner::Models::Unit.new(self.hourly_unit_attributes)
          end

          def total_amount
            @attributes['total_amount']
          end

          def total_unit_attributes
            @attributes.fetch('total_unit', {})
          end

          def total_unit
            @total_unit ||= CoreNutrition::Partner::Models::Unit.new(self.total_unit_attributes)
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
end
