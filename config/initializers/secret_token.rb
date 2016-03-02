# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
PersonalBrasilWebapi::Application.config.secret_token = 'ce11f48aaf6a6bceef9088ffc57bf7204e7ef83b12bf255259b8fd4b7c1aaea8414b65618c76c97ccb53fa19192b515ec68bc8f6ebcf1757d512d22a6fe3df85'
