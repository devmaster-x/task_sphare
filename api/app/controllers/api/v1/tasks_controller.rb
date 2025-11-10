module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!

      def index
        tasks = current_user.tasks.includes(:project)
        render json: tasks, each_serializer: TaskSerializer
      end

      def create
        task = TaskCreator.new(current_user, task_params).call
        render json: task, serializer: TaskSerializer, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.message }, status: :unprocessable_entity
      end

      private

      def task_params
        params.require(:task).permit(:title, :description, :status, :project_id)
      end
    end
  end
end
