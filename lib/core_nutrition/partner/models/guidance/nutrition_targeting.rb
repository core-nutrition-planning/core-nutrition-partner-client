module CoreNutrition
  module Partner
    module Models
      module Guidance
        class NutritionTargeting
          include Comparable

          # Returns an instance of the Nutrition Targeting
          #
          # @param attributes [Hash]
          #
          # @return [CoreNutrition::Partner::Models::Guidance::NutritionTargeting]
          def initialize(attributes={})
            @attributes = Hash(attributes)
          end

          def self.create(params={})
            request = CoreNutrition::Partner::Requests::Guidance::NutritionTargetings.create(params)

            request.on(:success) do |resp|
              response_body = resp.body
              response_data = response_body.fetch('data', {})

              return self.new(response_data)
            end
          end

          def self.summary(params={})
            request = CoreNutrition::Partner::Requests::Guidance::NutritionTargetings.summary(params)

            request.on(:success) do |resp|
              response_body = resp.body
              response_data = response_body.fetch('data', {})

              return self.new(response_data)
            end
          end

          def self.products(params={})
            request = CoreNutrition::Partner::Requests::Guidance::NutritionTargetings.products(params)

            request.on(:success) do |resp|
              response_body = resp.body
              response_data = response_body.fetch('data', {})

              return CoreNutrition::Partner::Models::Guidance::NutritionProducts.new(response_data)
            end
          end

          def partner_attributes
            @attributes.fetch('partner', {})
          end

          def partner_attributes?
            !self.partner_attributes.empty?
          end

          def partner_target
            if self.partner_attributes?
              CoreNutrition::Partner::Models::Guidance::PartnerTarget.new(self.partner_attributes)
            end
          end

          def carbohydrates_attributes
            @attributes.fetch('carbohydrates', {})
          end

          def carbohydrates_attributes?
            !self.carbohydrates_attributes.empty?
          end

          def carbohydrates_target
            if self.carbohydrates_attributes?
              CoreNutrition::Partner::Models::Guidance::CarbohydratesTarget.new(self.carbohydrates_attributes)
            end
          end

          def carbohydrates_target?
            !self.carbohydrates_target.nil?
          end

          def hydration_attributes
            @attributes.fetch('hydration', {})
          end

          def hydration_attributes?
            !self.hydration_attributes.empty?
          end

          def hydration_target
            if self.hydration_attributes?
              CoreNutrition::Partner::Models::Guidance::HydrationTarget.new(self.hydration_attributes)
            end
          end

          def duration_hours
            @attributes['duration_hours']
          end

          def duration_minutes
            @attributes['duration_minutes']
          end

          def channel_id
            @attributes['channel_id']
          end

          def channel
            @channel ||= CoreNutrition::Partner::Models::Guidance::Channels.retrieve(self.channel_id)
          end

          def channel?
            !self.channel.nil?
          end

          def goal_record_id
            @attributes['goal_record_id']
          end

          def goal_record
            @goal_record ||= CoreNutrition::Partner::Models::Guidance::GoalRecords.retrieve(self.goal_record_id)
          end

          def goal_record?
            !self.goal_record.nil?
          end

          def event_type_id
            @attributes['event_type_id']
          end

          def event_type
            @event_type ||= CoreNutrition::Partner::Models::Guidance::EventTypes.retrieve(self.event_type_id)
          end

          def event_type?
            !self.event_type.nil?
          end

          def athlete_level_type_id
            @attributes['athlete_level_type_id']
          end

          def athlete_level_type
            @athlete_level_type ||= CoreNutrition::Partner::Models::Guidance::AthleteLevelTypes.retrieve(self.athlete_level_type_id)
          end

          def athlete_level_type?
            !self.athlete_level_type.nil?
          end

          def distance_unit_type_id
            @attributes['distance_unit_type_id']
          end

          def distance_unit_type
            @distance_unit_type ||= CoreNutrition::Partner::Models::Guidance::DistanceUnitTypes.retrieve(self.distance_unit_type_id)
          end

          def distance_unit_type?
            !self.distance_unit_type.nil?
          end

          def weight
            @attributes['weight']
          end

          def mass_unit_type_id
            @attributes['mass_unit_type_id']
          end

          def mass_unit_type
            @mass_unit_type ||= CoreNutrition::Partner::Models::Guidance::MassUnitTypes.retrieve(self.mass_unit_type_id)
          end

          def mass_unit_type?
            !self.mass_unit_type.nil?
          end

          def temperature
            @attributes['temperature']
          end

          def temperature_unit_type_id
            @attributes['temperature_unit_type_id']
          end

          def temperature_unit_type
            @temperature_unit_type ||= CoreNutrition::Partner::Models::TemperatureUnitTypes.retrieve(self.temperature_unit_type_id)
          end

          def nutrition_products_attributes
            @attributes.fetch('nutrition_products', [])
          end

          def nutrition_products
            @nutrition_products ||= CoreNutrition::Partner::Models::Guidance::NutritionProducts.new(self.nutrition_products_attributes)
          end

          def nutrition_products?
            self.nutrition_products.any?
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
