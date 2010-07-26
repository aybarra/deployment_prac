# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deployment_prac_session',
  :secret      => 'a438b7abb40b8748039465a041e238296a07c5dadb9263d035a1d3006c919f57c95fdac3f4405bb912e7aaa8660412865abd0511f7fdeb233491ac9f71fcab22'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
