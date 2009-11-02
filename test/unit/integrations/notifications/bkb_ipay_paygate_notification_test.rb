require 'test_helper'

class BkbIpayPaygateNotificationTest < Test::Unit::TestCase
  include ActiveMerchant::Billing::Integrations

  def setup
    @bkb_ipay_paygate = BkbIpayPaygate::Notification.new(http_raw_data)
  end

  def test_accessors
    assert @bkb_ipay_paygate.complete?
    assert_equal "Completed", @bkb_ipay_paygate.status
    assert_equal "ORD9999", @bkb_ipay_paygate.item_id
    assert_equal "1111111111222222222233333333334444444444", @bkb_ipay_paygate.transaction_id
    assert_equal "3166.00", @bkb_ipay_paygate.gross
    assert_equal "USD", @bkb_ipay_paygate.currency
    assert_nil @bkb_ipay_paygate.received_at
    assert !@bkb_ipay_paygate.test?
    
    assert_equal "12345", @bkb_ipay_paygate.src
    assert_equal "54321", @bkb_ipay_paygate.prc
    assert_equal "JohnDoe", @bkb_ipay_paygate.holder
    assert_equal "98765", @bkb_ipay_paygate.pay_ref
    assert_equal "05", @bkb_ipay_paygate.eci
    assert_equal "Y", @bkb_ipay_paygate.payer_auth
    assert_equal "192.168.0.1", @bkb_ipay_paygate.source_ip
    assert_equal "UK", @bkb_ipay_paygate.ip_country
    assert_equal "1111", @bkb_ipay_paygate.cc_last_four
    assert_equal "4111", @bkb_ipay_paygate.cc_first_four
  end

  def test_compositions
    assert_equal Money.new(316600, 'USD'), @bkb_ipay_paygate.amount
  end

  # Replace with real successful acknowledgement code
  def test_acknowledgement    
    assert @bkb_ipay_paygate.acknowledge
  end

  def test_respond_to_acknowledge
    assert @bkb_ipay_paygate.respond_to?(:acknowledge)
  end

  private
  def http_raw_data
    "src=12345&prc=54321&Ord=1111111111222222222233333333334444444444&Holder=JohnDoe&successcode=0&Ref=ORD9999&PayRef=98765&Amt=3166.00&Cur=840&remark=&AuthId=997755&eci=05&payerAuth=Y&sourceIp=192.168.0.1&ipCountry=UK&cc1316=1111&cc0104=4111"
  end  
end
