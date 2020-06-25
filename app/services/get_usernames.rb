# frozen_string_literal: true

class GetUsernames
  def initialize(responses)
    @responses = responses
  end

  def call
    username_answers = responses.map do |response|
      response['answers'].select { |answer| answer.dig('field', 'id') == ENV['ANSWER_ID'] }
    end

    username_answers.flatten.map { |answer| answer['text'] }
  end

  private

  attr_reader :responses
end
