module CoreNutrition
  module Partner
    module Models
      module Guidance
        class DistanceUnitTypes
          include Enumerable

          def initialize(collection)
            @collection = Array(collection)
          end

          # Helper method to retrieve from the
          # request
          #
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Models::Guidance::DistanceUnitTypes]
          def self.list(params={})
            request = CoreNutrition::Partner::Requests::Guidance::DistanceUnitTypes.list(params)

            klass_attributes = []

            request.on(:success) do |resp|
              klass_attributes = resp.data_attributes
            end

            request.on(:failure) do |resp|
              CoreNutrition::Partner::Client.configuration.logger.error { ("Failure retrieving the records: %s" % [resp.status]) }
            end

            self.new(klass_attributes)
          end

          # Retrieve all options
          #
          # @note: This will retrieve all for now, but should auto paginate
          #
          # @return [Array]
          def self.options(params={})
            records = self.list(per_page: 250)
            records.options
          end

          # Helper method to retrieve from the request
          #
          # @param id [String]
          # @param params [Hash]
          #
          # @return [CoreNutrition::Partner::Models::Guidance::DistanceUnitType]
          def self.retrieve(id, params={})
            request = CoreNutrition::Partner::Requests::Guidance::DistanceUnitTypes.retrieve(id, params)

            request.on(:success) do |resp|
              return CoreNutrition::Partner::Models::Guidance::DistanceUnitType.new(resp.data_attributes)
            end

            request.on(:failure) do |resp|
              CoreNutrition::Partner::Client.configuration.logger.error { ("Failure retrieving the record: %s" % [resp.status]) }

              return nil
            end
          end

          # Retrieve the model from the request
          #
          # @param id [String]
          # @param params [Hash]
          #
          # @raises [CoreNutrition::Partner::Errors::RecordNotFoundError]
          #
          # @return [CoreNutrition::Partner::Models::Guidance::DistanceUnitType]
          def self.retrieve!(id, params={})
            request = CoreNutrition::Partner::Requests::Guidance::DistanceUnitTypes.retrieve(id, params)

            request.on(:success) do |resp|
              return CoreNutrition::Partner::Models::Guidance::DistanceUnitType.new(resp.data_attributes)
            end

            request.on(404) do
              raise CoreNutrition::Partner::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
            end
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
            @collection.map { |record| CoreNutrition::Partner::Models::Guidance::DistanceUnitType.new(record) }
          end
        end
      end
    end

  end
end
