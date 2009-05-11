# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stories_session',
  :secret      => '210f724d39adfc8218b77efd0ad9b1289b5bbc8944df2a6eb79455a5b0dad4ffdfd781755d5d49b340535c0c29493b75f1d7ae23d8f71b9597dde13b29145257'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
