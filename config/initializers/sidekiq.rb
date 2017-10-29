REDIS_URI = 'redis://h:pf8fb3b0578c852900631c2e9f92c2d4a29f91a2c281a9ac0c4fafddef1b4ebe7@ec2-34-250-82-211.eu-west-1.compute.amazonaws.com:29949'

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_URI }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URI }
end
