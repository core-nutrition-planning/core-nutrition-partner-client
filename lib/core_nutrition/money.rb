require 'money'

Money.locale_backend = nil
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

module CoreNutrition
  class Money < SimpleDelegator

    def initialize(obj, currency = ::Money::default_currency, options={})
      @_money = ::Money.new(obj, currency, options)
    end

    def __getobj__
      @_money
    end
  end
end

