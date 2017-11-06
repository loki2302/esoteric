require 'test/unit'
require 'drb'

class DrbTests < Test::Unit::TestCase
  def test_can_use_drb
    # server part
    DRb.start_service nil, Service.new
    service_uri = DRb.uri

    # client part
    DRb.start_service
    service = DRbObject.new nil, service_uri
    assert_equal(3, service.add_numbers(1, 2))
  end
end

class Service
  def add_numbers(a, b)
    a + b
  end
end