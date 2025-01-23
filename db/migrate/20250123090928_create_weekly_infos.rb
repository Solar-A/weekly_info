# frozen_string_literal: true

class CreateWeeklyInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_infos do |t|
      t.date :start
      t.date :ending
      t.string :main_astrological_event
      t.string :recommendation

      t.timestamps
    end
  end
end
