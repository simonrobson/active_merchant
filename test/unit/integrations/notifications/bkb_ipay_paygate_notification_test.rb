require 'test_helper'

class BkbIpayPaygateNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @bkb_ipay_paygate = BkbIpayPaygate::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @bkb_ipay_paygate.complete?
    assert_equal "", @bkb_ipay_paygate.status
    assert_equal "", @bkb_ipay_paygate.transaction_id
    assert_equal "", @bkb_ipay_paygate.item_id
    assert_equal "", @bkb_ipay_paygate.gross
    assert_equal "", @bkb_ipay_paygate.currency
    assert_equal "", @bkb_ipay_paygate.received_at
    assert @bkb_ipay_paygate.test?
  end

  def test_compositions
    assert_equal Money.new(3166, 'USD'), @bkb_ipay_paygate.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    

  end

  def test_send_acknowledgement
  end

  def test_respond_to_acknowledge
    assert @bkb_ipay_paygate.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    ""
  end  
end
