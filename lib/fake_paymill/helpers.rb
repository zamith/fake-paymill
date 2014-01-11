require 'digest/md5'
require 'active_support/gzip'

module FakePaymill
  module Helpers
    def gzip(content)
      ActiveSupport::Gzip.compress(content)
    end

    def gzipped_response(status_code, uncompressed_content)
      [status_code, { 'Content-Encoding' => 'gzip' }, gzip(uncompressed_content)]
    end
  end
end
