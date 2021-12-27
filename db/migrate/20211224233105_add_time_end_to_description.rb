# frozen_string_literal: true

class AddTimeEndToDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :descriptions, :time_end, :datetime
  end
end
