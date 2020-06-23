class PublicResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lecture, :rescue_from, :api
end
