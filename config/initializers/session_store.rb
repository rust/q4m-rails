# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_q4m-rails_session',
  :secret      => '740e8bbe8f798b89ccd24c6eef8c91c48d6991ece55bf64e0ab0ca79df27a59077d450268b51bfa76923ec15e2a2753e65b9fc2367dca010110258217a1a8515'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
