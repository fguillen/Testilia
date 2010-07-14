# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Testilia_session',
  :secret      => 'c24e582af927371aeaca3d77b14e1a411b5ea0fcf8260618208db7c1f28181f9aba577d76400acee05734d5c4de93e1da5434848561e14dc4751fc8d433aa15c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
