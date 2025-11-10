class TaskCreator
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    project = @user.projects.find(@params[:project_id])
    task = project.tasks.create!(@params)
    TaskNotificationJob.perform_later(task.id)
    task
  end
end
