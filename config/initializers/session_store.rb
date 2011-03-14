# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_radio_session',
  :secret      => 'd38f49a10c74a61d2c0b5245596122cd7e243e202c92600dd30ba6be51fca530d9795bf7103ef827b57c858765674ca7c40907383f173e10f5d62b5d0bf2a7e0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
#ActionController::Base.session_store = :active_record_store
