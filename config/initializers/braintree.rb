# Those are just delegation to Braintree::Configuration
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['MERCHANT_ID']
Braintree::Configuration.public_key = ENV['PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['PRIVATE_KEY']

# This is just a convenient place you can put your CSE key
# Braintree::Configuration.client_side_encryption_key = ENV['CLIENT_SIDE_ENCRYPTION_KEY']
