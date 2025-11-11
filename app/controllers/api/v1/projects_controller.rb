module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:show, :update, :destroy]

      # GET /api/v1/projects
      def index
        projects = Project.all.includes(:user, :tasks)
        render json: projects, each_serializer: ProjectSerializer
      end

      # POST /api/v1/projects
      def create
        project = Project.new(project_params)

        if project.save
          render json: project, serializer: ProjectSerializer, status: :created
        else
          render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/projects/:id
      def show
        render json: @project, serializer: ProjectSerializer
      end

      # PUT /api/v1/projects/:id
      def update
        if @project.update(project_params)
          render json: @project, serializer: ProjectSerializer
        else
          render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/projects/:id
      def destroy
        @project.destroy
        render json: { message: 'Project deleted successfully' }, status: :ok
      end

      private

      def set_project
        @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def project_params
        params.require(:project).permit(:title, :description, :user_id)
      end
    end
  end
end


