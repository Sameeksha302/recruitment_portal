# require "sidekiq-scheduler"

# Sidekiq.configure_server do |config|
#     config.redis = { url: "redis://localhost:6379/0" }
#     config.on(:startup) do
#         Sidekiq::Scheduler.load_schedule!
#     end
# end

# Sidekiq.configure_client do |config|
# config.redis = { url: "redis://localhost:6379/0" }
# end

require "sidekiq-scheduler"
Sidekiq.configure_server do |config|
    config.redis = {
      url: Rails.env.development? ? "redis://localhost:6379/0" : ENV["REDIS_URL"]
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      url: Rails.env.development? ? "redis://localhost:6379/0" : ENV["REDIS_URL"]
    }
  end


# require "sidekiq-scheduler"

# Sidekiq.configure_server do |config|
#     config.redis = { url: ENV["REDIS_URL"]}
#     config.on(:startup) do
#         Sidekiq::Scheduler.load_schedule!
#     end
# end

# Sidekiq.configure_client do |config|
# config.redis = { url: ENV["REDIS_URL"]}
# end
