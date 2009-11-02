require File.dirname(__FILE__) + '/bkb_ipay_paygate/helper.rb'
require File.dirname(__FILE__) + '/bkb_ipay_paygate/notification.rb'


#
# Currently supports "Client Post through Browser" integration mode
#
# Typical usage looks like this
#
#     <% payment_service_for "ORD1002", 'merchant_id',
#                                  :amount => 50.00, 
#                                  :currency => 'USD',
#                                  :service => :bkb_ipay_paygate,
#                                  :html => { :id => 'payment-form' } do |service| %>
#     
#     <% service.successUrl = "http://localhost/success" %>
#     <% service.failUrl = "http://localhost/fail" %>
#     <% service.cancelUrl = "http://localhost/cancel" %>
#     
#     <% end %>
#
# Unconfirmed: response should come from: 119.46.71.125, 210.4.158.125
#
# The the datafeed URL can be configured something like this (in a rails context)
#
# 
#
#

#   def data_feed 
#     notification = BkbIpayPaygate.notification(post)
#     if notification.valid_sender?(request) # always returns true until IP addresses are confirmed
#       if notification.complete?
#         #record successful transaction for notification.item_id
#       else
#         #record failed transaction for notification.item_id
#       end
#     else
#       #log bad call
#     end
#
#     render :text => "OK", :layout => false and return
#
#   end

#

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module BkbIpayPaygate 
       
        # These are the same after the latest update
        TEST_URL = 'https://ipay.bangkokbank.com/b2c/eng/payment/payForm.jsp'
        LIVE_URL = 'https://ipay.bangkokbank.com/b2c/eng/payment/payForm.jsp'
        
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
