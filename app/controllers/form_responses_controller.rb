# frozen_string_literal: true

class FormResponsesController < ActionController::API
  NUM_OF_QUESTIONS = 5

  def index
    # don't write like this in real-life projects - use services or commands!
    request = Typhoeus.get(
      "https://api.typeform.com/forms/#{ENV['FORM_ID']}/responses",
      headers: { Authorization: "bearer #{ENV['TYPEFORM_TOKEN']}" }
    )

    # in production you would anticipate negative case too
    body          = JSON.parse(request.body)
    all_responses = body['items']

    username_answers = all_responses.map do |response|
      next if response['answers'].length != NUM_OF_QUESTIONS

      response['answers'].select do |answer|
        answer.dig('field', 'id') == ENV['ANSWER_ID']
      end
    end.compact

    username_answers = username_answers.flatten
    usernames        = username_answers.map { |answer| answer['text'] }

    render json: { usernames: usernames }, status: :ok
  end
end
