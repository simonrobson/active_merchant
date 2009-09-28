require File.dirname(__FILE__) + '/bkb_ipay_paygate/helper.rb'
require File.dirname(__FILE__) + '/bkb_ipay_paygate/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module BkbIpayPaygate 
       
        TEST_URL = 'https://ipay.bangkokbank.com/b2c/eng/payment/payForm.jsp'
        LIVE_URL = 'https://pspaysecure.bangkokbank.com/b2c/eng/payment/payForm.jsp'
        
        def self.service_url
          ActiveMerchant::Billing::Base.integration_mode == :test ? TEST_URL : LIVE_URL
        end

        def self.notification(post)
          Notification.new(post)
        end  
      end
    end
  end
end
