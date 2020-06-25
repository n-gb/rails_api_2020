RSpec.shared_context 'typeform responses' do
  let(:username) { '@n.gubernator' }
  let(:responses) do
    [
      {
        "landing_id"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "token"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "response_id"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "landed_at"=>"2020-06-23T19:44:09Z",
        "submitted_at"=>"2020-06-23T19:44:54Z",
        "metadata"=>{
          "user_agent"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36",
          "platform"=>"other",
          "referer"=>"https://nadiagubernator.typeform.com/to/GGRWcvff",
          "network_id"=>"f31a0a1c2a",
          "browser"=>"default"
        },
        "hidden"=>{},
        "calculated"=>{"score"=>0},
        "answers"=>[
          {
            "field"=>
            {
              "id"=>"IYFb5HT86dgO",
              "ref"=>"371515dc-a377-476a-b269-5e774fa3692a",
              "type"=>"long_text"
            },
            "type"=>"text",
            "text"=>"Дуже сподіваюся що всім було весело вчити про Rails API - бо тема класна"
          },
          {
            "field"=>
            {
              "id"=>"47kPXVYArPHj",
              "ref"=>"f5da3205-f640-4f40-88ed-66f840c558cd",
              "type"=>"short_text"
            },
            "type"=>"text",
            "text"=>username
          }
        ]
      }
    ]
  end
  let(:responses_without_username) do
    [
      {
        "landing_id"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "token"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "response_id"=>"gni6np64m1g6jycs3e8fgni6ncblwyh9",
        "landed_at"=>"2020-06-23T19:44:09Z",
        "submitted_at"=>"2020-06-23T19:44:54Z",
        "metadata"=>{
          "user_agent"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36",
          "platform"=>"other",
          "referer"=>"https://nadiagubernator.typeform.com/to/GGRWcvff",
          "network_id"=>"f31a0a1c2a",
          "browser"=>"default"
        },
        "hidden"=>{},
        "calculated"=>{"score"=>0},
        "answers"=>[
          {
            "field"=>
            {
              "id"=>"IYFb5HT86dgO",
              "ref"=>"371515dc-a377-476a-b269-5e774fa3692a",
              "type"=>"long_text"
            },
            "type"=>"text",
            "text"=>"Дуже сподіваюся що всім було весело вчити про Rails API - бо тема класна"
          }
        ]
      }
    ]
  end
end
