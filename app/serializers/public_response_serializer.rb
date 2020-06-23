# frozen_string_literal: true

class PublicResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lecture, :rescue_from, :api
end
