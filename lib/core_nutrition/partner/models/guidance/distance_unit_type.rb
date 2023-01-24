module CoreNutrition
  module Partner
    module Models
      module Guidance
        class DistanceUnitType
          include Comparable

          # Returns an instance of the Distance Unit Type
          #
          # @param attributes [Hash]
          #
          # @return [CoreNutrition::Partner::Models::Guidance::DistanceUnitType]
          def initialize(attributes={})
            @attributes = attributes
          end

          # Returns the ID
          #
          # @return [Integer]
          def id
            @attributes['id']
          end

          # Returns the name
          #
          # @return [String]
          def name
            @attributes['name']
          end

          # Returns the label
          #
          # @return [String]
          def label
            @attributes['label']
          end

          # Returns the unit name
          #
          # @return [String]
          def unit_name
            @attributes['unit_name']
          end

          # Returns the base unit
          #
          # @return [RubyUnits::Unit,NilClass]
          def base_unit
            begin
              RubyUnits::Unit.new(self.unit_name)
            rescue
              nil
            end
          end

          # Returns true if there is a base unit
          #
          # @return [Boolean]
          def base_unit?
            !self.base_unit.nil?
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
            [self.label, self.id]
          end
        end
      end
    end
  end
end
