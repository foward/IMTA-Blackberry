# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IMTA_session',
  :secret      => '701d8914cb99d4a29868fd8b3b2de5b4aa9b0f729cdca10067971d4b57bbf43bb73f5b9af7ea79a1a6adcae537f08c45e037f5de4efedb36bc318d0c7be77313'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
