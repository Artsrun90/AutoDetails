require 'test_helper'


class RestTest < ActiveSupport::TestCase
  test '#get_brands_by_oemm' do
    WebMock.allow_net_connect!
    rest = Rest.new( ENV['API_KEY'])
    result = rest.get_brands_by_oem('OP572')    
    assert result.is_a? Hash
    assert result['data'].is_a? Array
  end

  test '#get_by_brand_and_oem' do
    WebMock.allow_net_connect!
    rest = Rest.new( ENV['API_KEY'])
    result = rest.get_by_brand_and_oem('OP572', 'FILTRON')    
    assert result.is_a? Hash
    assert result['data'].is_a? Array
  end
  
end