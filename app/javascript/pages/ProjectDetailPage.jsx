import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import client from '../api/client';
import TaskForm from '../components/TaskForm';
import TaskList from '../components/TaskList';

export default function ProjectDetailPage() {
  const { id } = useParams();
  const [project, setProject] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchProject();
  }, [id]);

  const fetchProject = async () => {
    try {
      const response = await client.get(`/projects/${id}`);
      setProject(response.data);
    } finally {
      setLoading(false);
    }
  };

  const handleTaskCreated = (newTask) => {
    setProject({
      ...project,
      tasks: [...project.tasks, newTask],
    });
  };

  const handleTaskUpdated = (updatedTask) => {
    setProject({
      ...project,
      tasks: project.tasks.map(t => t.id === updatedTask.id ? updatedTask : t),
    });
  };

  const handleTaskDeleted = (taskId) => {
    setProject({
      ...project,
      tasks: project.tasks.filter(t => t.id !== taskId),
    });
  };

  if (loading) return <div className="text-center text-gray-500 py-12">Loading...</div>;
  if (!project) return <div className="text-center text-gray-500 py-12">Project not found</div>;

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">{project.title}</h1>
          {project.description && (
            <p className="text-gray-600 mt-2">{project.description}</p>
          )}
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-1">
            <div className="bg-white rounded-lg shadow p-6">
              <TaskForm projectId={id} onTaskCreated={handleTaskCreated} />
            </div>
          </div>

          <div className="lg:col-span-2">
            <TaskList
              tasks={project.tasks || []}
              onTaskUpdated={handleTaskUpdated}
              onTaskDeleted={handleTaskDeleted}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

