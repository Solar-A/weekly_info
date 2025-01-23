# frozen_string_literal: true

class Api::V1::WeeklyInfoRepresenter < BaseRepresenter
  def call(weekly_info)
    {
      start: weekly_info.start,
      ending: weekly_info.ending,
      recommendation: weekly_info.recommendation,
      main_astrological_event: weekly_info.main_astrological_event
    }
  end
end
