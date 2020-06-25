require 'rails_helper'

RSpec.describe GetUsernames, type: :service do
  describe '#call' do
    include_context 'typeform responses'

    it 'returns usernames' do
      result = described_class.new(responses).call

      expect(result).to eq Array(username)
    end

    context 'no answers with username' do
      it 'returns empty array' do
        result = described_class.new(responses_without_username).call

        expect(result).to eq Array.new
      end
    end

    context 'no responses' do
      let(:responses) { Array.new }

      it 'returns empty array' do
        result = described_class.new(responses).call

        expect(result).to eq Array.new
      end
    end
  end
end
