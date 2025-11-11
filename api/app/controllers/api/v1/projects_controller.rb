module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        projects = Project.all.includes(:user, :tasks)
        render json: projects, each_serializer: ProjectSerializer
      end

      def create
        project = Project.new(project_params)
        if project.save
          render json: project, serializer: ProjectSerializer, status: :created
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        project = Project.find(params[:id])
        render json: project, serializer: ProjectSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def update
        project = Project.find(params[:id])
        if project.update(project_params)
          render json: project, serializer: ProjectSerializer
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def destroy
        project = Project.find(params[:id])
        project.destroy
        render json: { message: 'Project deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      private

      def project_params
        params.require(:project).permit(:title, :description, :user_id)
      end
    end
  end
end

