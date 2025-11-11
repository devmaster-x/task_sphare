import { useEffect, useState } from 'react';
import client from '../api/client';
import ProjectForm from '../components/ProjectForm';
import ProjectList from '../components/ProjectList';

export default function ProjectsPage() {
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchProjects();
  }, []);

  const fetchProjects = async () => {
    try {
      const response = await client.get('/projects');
      setProjects(response.data);
    } finally {
      setLoading(false);
    }
  };

  const handleProjectCreated = (newProject) => {
    setProjects([...projects, newProject]);
  };

  const handleProjectDeleted = (projectId) => {
    setProjects(projects.filter(p => p.id !== projectId));
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="flex justify-between items-center mb-8">
          <h1 className="text-3xl font-bold text-gray-900">Projects</h1>
        </div>

        <div className="bg-white rounded-lg shadow mb-8">
          <ProjectForm onProjectCreated={handleProjectCreated} />
        </div>

        {loading ? (
          <div className="text-center text-gray-500">Loading...</div>
        ) : (
          <ProjectList projects={projects} onProjectDeleted={handleProjectDeleted} />
        )}
      </div>
    </div>
  );
}

