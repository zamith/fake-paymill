require 'sinatra/base'

module FakePaymill
  class SinatraApp < Sinatra::Base
    set :show_exceptions, false
    set :dump_errors, true
    set :raise_errors, true
    disable :logging

    include Helpers

    # Paymill::Client.all
    get "/#{Paymill.api_version}/clients/" do
      gzipped_response(200, {
        "data" => [{
          "id" => "dummy_client",
          "email" => "lovely-client@example.com",
          "description" =>"Lovely Client",
          "created_at" => 1342438695,
          "updated_at" => 1342438695,
        }],
        "mode" => "test"
      }.to_json)
    end
  end
end
