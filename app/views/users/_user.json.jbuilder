# frozen_string_literal: true

json.extract! user, :id, :username, :password_digest, :price, :created_at, :updated_at
json.url user_url(user, format: :json)
