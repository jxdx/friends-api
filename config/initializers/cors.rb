# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 2, Rack::Cors do
  allow do
    if Rails.env.development?
      origins '*'
    elsif Rails.env.production?
      origins '*'
      # raise "Set front end url address for cors.rb. Make sure you allow stripe webhooks in"
    elsif Rails.env.review?
      origins '*'
    elsif Rails.env.staging?
      origins '*'
      # raise "Set staging front end url address for cors.rb. Make sure you allow stripe webhooks in"
    elsif Rails.env.test?
      origins '*'
    else
      raise "Environment not defined"
    end


    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
