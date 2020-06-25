require 'rails_helper'

RSpec.describe GetAllTypeformResponses, type: :service do
  describe '#call' do
    context 'connection with Typeform works' do
      before do
        stub_request(:get, "https://api.typeform.com/forms/#{ENV['FORM_ID']}/responses").
          with(headers: { Authorization: "bearer #{ENV['TYPEFORM_TOKEN']}" }).
          to_return(status: 200, body: { 'items' => 'image that this string here is responses' }.to_json)
      end

      it 'is successfull' do
        result = described_class.new.call

        expect(result.success?).to be_truthy
      end

      it 'returns responses' do
        result = described_class.new.call

        expect(result.data).to be_present
      end

      it 'returns no errors' do
        result = described_class.new.call

        expect(result.errors).to be_nil
      end
    end

    context 'connection with Typeform does not work' do
      before do
        stub_request(:get, "https://api.typeform.com/forms/#{ENV['FORM_ID']}/responses").
          with(headers: { Authorization: "bearer #{ENV['TYPEFORM_TOKEN']}" }).
          to_return(status: 403)
      end

      it 'is not successfull' do
        result = described_class.new.call

        expect(result.success?).to be_falsey
      end

      it 'returns errors' do
        result = described_class.new.call

        expect(result.errors).not_to be_nil
      end
    end
  end
end
