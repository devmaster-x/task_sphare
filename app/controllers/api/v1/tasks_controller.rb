module Api
  module V1
    class TasksController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_project
      before_action :set_task, only: [:update, :destroy]

      # GET /api/v1/projects/:project_id/tasks
      def index
        tasks = @project.tasks
        render json: tasks, each_serializer: TaskSerializer
      end

      # POST /api/v1/projects/:project_id/tasks
      def create
        task = @project.tasks.new(task_params)

        if task.save
          render json: task, serializer: TaskSerializer, status: :created
        else
          render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/projects/:project_id/tasks/:id
      def update
        if @task.update(task_params)
          render json: @task, serializer: TaskSerializer
        else
          render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/projects/:project_id/tasks/:id
      def destroy
        @task.destroy
        render json: { message: 'Task deleted successfully' }, status: :ok
      end

      private

      def set_project
        @project = Project.find(params[:project_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def set_task
        @task = Task.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Task not found' }, status: :not_found
      end

      def task_params
        params.require(:task).permit(:title, :description, :status)
      end
    end
  end
end

