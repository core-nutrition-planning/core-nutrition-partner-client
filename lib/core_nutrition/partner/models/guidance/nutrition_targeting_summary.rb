module CoreNutrition
  module Partner
    module Models
      module Guidance
        class NutritionTargetingSummary
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

          def duration_hours
            @attributes['duration_hours']
          end

          def duration_minutes
            @attributes['duration_minutes']
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
