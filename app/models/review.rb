# frozen_string_literal: true

class Review < ApplicationRecord
  def reviewer
    User.find(reviewer_id) unless reviewer_id.nil?
  end
end
