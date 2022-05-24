require 'bigdecimal'

module CoreNutrition
  module Partner
    module Models
      class Price
        def initialize(attributes={})
          @attributes = Hash(attributes)
        end

        def currency_code
          @attributes['currency_code']
        end

        def amount_value
          @attributes['amount']
        end

        def amount
          begin
            BigDecimal(self.amount_value.to_s)
          rescue
            BigDecimal('0.0')
          end
        end

        def cents_amount
          begin
            self.amount * 100.0
          rescue
            0.0
          end
        end

        def to_formatted_s
          if self.money?
            self.money.format
          else
            ''
          end
        end

        def money
          begin
            @money ||= CoreNutrition::Money.new(self.cents_amount.to_f, self.currency_code)
          rescue
            nil
          end
        end

        def money?
          !self.money.nil?
        end

        def currency
          if self.money?
            self.money.currency
          end
        end

        def currency?
          !self.currency.nil?
        end

        def country
          @country ||= ISO3166::Country[self.currency_code]
        end
      end
    end
  end
end
