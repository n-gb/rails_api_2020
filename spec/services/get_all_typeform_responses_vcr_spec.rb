require 'rails_helper'

RSpec.describe GetAllTypeformResponses, type: :service do
  describe '#call' do
    context 'connection with Typeform works' do
      it 'is successfull' do
        VCR.use_cassette('typeform_responses_success') do
          result = described_class.new.call

          expect(result.success?).to be_truthy
        end
      end

      it 'returns responses' do
        VCR.use_cassette('typeform_responses_success') do
          result = described_class.new.call

          expect(result.data).to be_present
        end
      end

      it 'returns no errors' do
        VCR.use_cassette('typeform_responses_success') do
          result = described_class.new.call

          expect(result.errors).to be_nil
        end
      end
    end

    context 'connection with Typeform does not work' do
      it 'is not successfull' do
        VCR.use_cassette('typeform_responses_failure') do
          result = described_class.new.call

          expect(result.success?).to be_falsey
        end
      end

      it 'returns errors' do
        VCR.use_cassette('typeform_responses_failure') do
          result = described_class.new.call

          expect(result.errors).not_to be_nil
        end
      end
    end
  end
end
