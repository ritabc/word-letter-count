class ApplicationController < ActionController::API
  include Response

  rescue_from NoMethodError do
    json_response({ Error: "A param named 'value' is required" }, :unprocessable_entity)
  end
end
