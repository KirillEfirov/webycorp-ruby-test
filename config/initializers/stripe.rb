# frozen_string_literal: true

Stripe.api_key = Settings.stripe.api_key
Stripe.open_timeout = Settings.stripe.open_timeout
Stripe.read_timeout = Settings.stripe.read_timeout
Stripe.write_timeout = Settings.stripe.write_timeout
Stripe.max_network_retries = Settings.stripe.max_network_retries
Stripe.log_level = Stripe::LEVEL_INFO
