# frozen_string_literal: true

class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :confidence, :lecture, :rescue_from, :api

  attribute :optimism do |object|
    object.confidence * 100
  end
end
