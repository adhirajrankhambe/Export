# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Export_session',
  :secret      => '119be9d956ae2cdf4f5c62427b67a0c435a228cc7a269070930ec86924bfff9d5db479eb404fe63a38021fed2bf1259e5b60b795cf810a2f992c0384d2372d00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
