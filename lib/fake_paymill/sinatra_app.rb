require 'sinatra/base'

module FakePaymill
  class SinatraApp < Sinatra::Base
    set :show_exceptions, false
    set :dump_errors, true
    set :raise_errors, true
    disable :logging

    include Helpers

    get '/' do
      gzipped_response(200, 'OK')
    end
  end
end
