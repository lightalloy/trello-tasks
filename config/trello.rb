Trello.configure do |config|
  config.developer_public_key = ENV.fetch('DEVELOPER_PUBLIC_KEY') # The "key" from step 1
  config.member_token = ENV.fetch('MEMBER_TOKEN') # The token from step 2.
end
