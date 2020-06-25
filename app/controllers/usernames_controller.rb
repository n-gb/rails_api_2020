# frozen_string_literal: true

class UsernamesController < ActionController::API
  def index
    responses = GetAllTypeformResponses.new.call

    if responses.success?
      usernames = GetUsernames.new(responses.data).call

      render json: { usernames: usernames }, status: :ok
    else
      render json: { errors: responses.errors }, status: :unprocessable_entity
    end
  end
end
