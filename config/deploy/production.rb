server "ec2-18-194-52-148.eu-central-1.compute.amazonaws.com",
  user: fetch(:user), roles: %w{app web db sidekiq}
