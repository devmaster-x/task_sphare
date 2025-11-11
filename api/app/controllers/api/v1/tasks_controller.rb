module Api
  module V1
    class TasksController < ApplicationController
      def index
        project = Project.find(params[:project_id])
        tasks = project.tasks
        render json: tasks, each_serializer: TaskSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def create
        project = Project.find(params[:project_id])
        task = project.tasks.new(task_params)
        if task.save
          render json: task, serializer: TaskSerializer, status: :created
        else
          render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def update
        task = Task.find(params[:id])
        if task.update(task_params)
          render json: task, serializer: TaskSerializer
        else
          render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Task not found' }, status: :not_found
      end

      def destroy
        task = Task.find(params[:id])
        task.destroy
        render json: { message: 'Task deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Task not found' }, status: :not_found
      end

      private

      def task_params
        params.require(:task).permit(:title, :description, :status)
      end
    end
  end
end
