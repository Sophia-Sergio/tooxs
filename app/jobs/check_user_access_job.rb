class CheckUserAccessJob < ApplicationJob
  queue_as :default

  def perform(*args)
    users = User.where.not last_sign_in_at: nil
    CheckUserAccessWorker.perform_in(30.seconds, users.count)
  end
end
