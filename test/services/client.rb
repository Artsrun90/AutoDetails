require 'test_helper'

class ClientTest < ActiveSupport::TestCase

    test "#get" do
        WebMock.allow_net_connect!
        client = Client.new(ENV['API_KEY'])
        option = {oem: 'OP572'}
        result = client.get('/backend/price_items/api/v1/search/get_brands_by_oem', option)
        assert result.is_a? Hash
    end
    
end