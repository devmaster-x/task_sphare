import { useNavigate } from 'react-router-dom';
import client from '../api/client';

export default function ProjectList({ projects, onProjectDeleted }) {
  const navigate = useNavigate();

  const handleDelete = async (projectId) => {
    if (!window.confirm('Are you sure?')) return;
    
    try {
      await client.delete(`/projects/${projectId}`);
      onProjectDeleted(projectId);
    } catch (err) {
      alert('Failed to delete project');
    }
  };

  if (projects.length === 0) {
    return (
      <div className="text-center py-12 bg-white rounded-lg shadow">
        <p className="text-gray-500">No projects yet</p>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      {projects.map(project => (
        <div
          key={project.id}
          className="bg-white rounded-lg shadow hover:shadow-lg transition-shadow cursor-pointer"
          onClick={() => navigate(`/projects/${project.id}`)}
        >
          <div className="p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">
              {project.title}
            </h3>
            {project.description && (
              <p className="text-gray-600 text-sm mb-4 line-clamp-2">
                {project.description}
              </p>
            )}
            <div className="flex items-center justify-between text-sm text-gray-500">
              <span>{project.tasks?.length || 0} tasks</span>
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  handleDelete(project.id);
                }}
                className="text-red-600 hover:text-red-800 font-medium"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}

