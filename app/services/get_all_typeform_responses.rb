# frozen_string_literal: true

class GetAllTypeformResponses
  def call
    return failure unless request.success?

    body      = JSON.parse(request.body)
    responses = body['items']

    success(responses)
  end

  private

  def request
    @request ||= Typhoeus.get(
      "https://api.typeform.com/forms/#{ENV['FORM_ID']}/responses",
      headers: { Authorization: "bearer #{ENV['TYPEFORM_TOKEN']}" }
    )
  end

  def failure
    OpenStruct.new(success?: false, errors: 'HTTP request failed: ' + request.code.to_s)
  end

  def success(responses)
    OpenStruct.new(success?: true, data: responses, errors: nil)
  end
end
