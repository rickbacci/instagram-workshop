Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram,
    ENV['instagram_id'],
    ENV['instagram_secret']
end

