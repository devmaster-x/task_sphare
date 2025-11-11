class TaskNotificationJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find(task_id)
    NotificationService.new(task).notify
  end
end
