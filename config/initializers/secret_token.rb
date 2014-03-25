# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file=Rails.rooot.join(.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file.chomp)
	else
		# Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
	end
end

SampleApp::Application.config.secret_key_base = secure_token

#'d1e5c7be34e6190d790a27cd717b1442f3240a15b31b4e3df57d96c69580271fec22c9fa8aa4137b4a705ef2975ef80a9228ef9ba1be8fe25644b4e6cd40b9a5'
