require 'capybara'
require 'capybara/server'
require 'rack/handler/thin'

module FakePaymill
  class Server
    def boot
      with_thin_runner do
        server = Capybara::Server.new(FakePaymill::SinatraApp)
        server.boot
        ENV['GATEWAY_PORT'] = server.port.to_s
      end
    end

    private
    def with_thin_runner
      default_server_process = Capybara.server
      Capybara.server do |app, port|
        Rack::Handler::Thin.run(app, Port: port)
      end
      yield
    ensure
      Capybara.server(&default_server_process)
    end
  end
end
