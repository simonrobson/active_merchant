require 'test_helper'

class BkbIpayPaygateModuleTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations
  
  def test_notification_method
    assert_instance_of BkbIpayPaygate::Notification, BkbIpayPaygate.notification('name=cody')
  end
end 
