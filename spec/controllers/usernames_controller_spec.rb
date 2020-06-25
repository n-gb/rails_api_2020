require 'rails_helper'

# It's a simple case - so in production I wouldn't write controller test
# But it's here to show you that you don't need to test same functionality twice

describe UsernamesController, type: :controller do
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET #index' do
    context 'did not get responses successfully' do
      let(:stubbed_result) { OpenStruct.new(success?: false, errors: 'HTTP request failed: 422') }

      before do
        allow(GetAllTypeformResponses).to receive_message_chain(:new, :call).and_return(stubbed_result)
      end

      it 'returns errors' do
        get :index

        expect(response_body['errors']).not_to be_nil
      end

      it 'returns correct status' do
        get :index

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'got responses successfully' do
      context 'there were usernames' do
        let(:stubbed_result) { OpenStruct.new(success?: true) }
        let(:username) { 'NadiaGubernator' }

        before do
          allow(GetAllTypeformResponses).to receive_message_chain(:new, :call).and_return(stubbed_result)
          allow(GetUsernames).to receive_message_chain(:new, :call).and_return(Array(username))
        end

        it 'returns usernames' do
          get :index

          expect(response_body['usernames']).to eq(Array(username))
        end

        it 'returns correct status' do
          get :index

          expect(response).to have_http_status(:ok)
        end
      end

      context 'there were no usernames'do
        let(:stubbed_result) { OpenStruct.new(success?: true) }

        before do
          allow(GetAllTypeformResponses).to receive_message_chain(:new, :call).and_return(stubbed_result)
          allow(GetUsernames).to receive_message_chain(:new, :call).and_return(Array.new)
        end

        it 'returns empty usernames' do
          get :index

          expect(response_body['usernames']).to eq(Array.new)
        end

        it 'returns correct status' do
          get :index

          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
