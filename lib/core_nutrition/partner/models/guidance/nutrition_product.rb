module CoreNutrition
  module Partner
    module Models
      module Guidance
        class NutritionProduct
          include Comparable

          def initialize(attributes={})
            @attributes = attributes
          end

          def id
            @attributes['id']
          end

          def name
            @attributes['name']
          end

          def display_name
            @attributes['display_name']
          end

          def flavor_name
            @attributes['flavor_name']
          end

          def product_form_name
            @attributes['product_form_name']
          end

          def manufacturer_name
            @attributes['manufacturer_name']
          end

          def carbohydrates_amount
            @attributes['carbohydrates_amount']
          end

          def price_attributes
            @attributes.fetch('price', {})
          end

          def price
            CoreNutrition::Partner::Models::Price.new(self.price_attributes)
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
end
