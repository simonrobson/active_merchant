module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module BkbIpayPaygate
        class Helper < ActiveMerchant::Billing::Integrations::Helper
          
          mapping :order, 'orderRef'
          mapping :amount, 'amount'
          mapping :currency, 'currCode'
          mapping :account, 'merchantId'
          mapping :lang, 'lang'
          mapping :cancelUrl, 'cancelUrl'
          mapping :failUrl, 'failUrl'
          mapping :successUrl, 'successUrl'
          mapping :payType, 'payType'
          mapping :payMethod, 'payMethod'
          mapping :redirect, 'redirect'
          mapping :remark, 'remark'
          
          def initialize(order, account, options = {})
            super        
            
            # The language of the payment page i.e.
            # "T" – Thai. 
            # "E" – English
            add_field('lang', 'E')
            # The payment type: 
            # "N" – Normal Payment (Sales) 
            # "H" – Hold Payment (Authorize only)
            add_field('payType', 'N')
            # The payment method:
            # "ALL" – All the available payment method
            # "CC" – Credit Card Payment
            add_field('payMethod', 'ALL')
            # The number of seconds before auto-redirection to merchant's site 
            # takes place at iPay’s Payment Success / Fail page
            add_field('redirect', '5')
          end
          
          # The currency of the payment i.e. 
          # "764" – THB 
          # "840" – USD 
          # Default to Baht
          CURRENCY_MAPPING = {'THB' => '764', '764' => '764',
                                'USD' => '840', '840' => '840'}
          def currency=(currency_code)
            code = CURRENCY_MAPPING[currency_code]
  					raise StandardError, "Invalid currency code #{currency_code} specified" if code.nil?
            
            add_field(mappings[:currency], code)
          end
          
        end
      end
    end
  end
end
