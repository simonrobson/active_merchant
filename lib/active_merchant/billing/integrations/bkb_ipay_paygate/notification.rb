require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module BkbIpayPaygate
        class Notification < ActiveMerchant::Billing::Integrations::Notification
          
          # Changed and confirmed 27-01-2010 in email from Bangkok Bank
          self.production_ips = [ '119.46.71.125', '110.164.207.125' ]
          
          SUCCESS = '0'
          
          def complete?
            status == 'Completed'
          end

          def transaction_id
            params['Ord']
          end
          
          def item_id
            params['Ref']
          end

          # When was this payment received by the client. 
          def received_at
            nil
          end

          # the money amount we received in X.2 decimal.
          def gross
            params['Amt']
          end
          
          # Return bank host status code (secondary)
          def src
            params['src']
          end
          
          # Return bank host status code (primary)
          def prc
            params['prc']
          end
          
          # The Name of the holder of the Payment Account
          def holder
            params['Holder']
          end
          
          # iPay Payment Reference Number
          def pay_ref
            params['PayRef']
          end
          
          # ECI value (for 3D enabled Merchants) - Documentation omitted
          def eci
            params['eci']
          end
          
          # Payer Authentication Status
          # Y - Card is 3D-secure enrolled and authentication succeeds.
          # N - Card is 3D-secure enrolled but authentication fails.
          # P - 3D Secure check is pending
          # A - Card is not 3D-secure enrolled yet
          # U - 3D-secure check has not been processed.
          def payer_auth
            params['payerAuth']
          end
          
          def source_ip
            params['sourceIp']
          end
          
          def ip_country
            params['ipCountry']
          end
          
          def cc_last_four
            params['cc1316']
          end
          
          def cc_first_four
            params['cc0104']
          end
          
          CURRENCY_CODES = {'840' => 'USD', '764' => 'THB'}
          def currency
            CURRENCY_CODES[params['Cur']] rescue 'THB'
          end
          
          def test?
            false
          end

          def status
            params['successcode'] == SUCCESS ? 'Completed' : 'Failed'
          end
          
          
          def acknowledge      
            true
          end
        end
      end
    end
  end
end
