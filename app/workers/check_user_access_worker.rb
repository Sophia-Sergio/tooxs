class CheckUserAccessWorker
  include Sidekiq::Worker

  def perform(users_count)
    Tooxs::UserAccessMailer.with(users_count: users_count).user_access.deliver_later
  end
end
