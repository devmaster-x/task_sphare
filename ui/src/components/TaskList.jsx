import client from '../api/client';

const statusColors = {
  pending: 'bg-yellow-100 text-yellow-800',
  in_progress: 'bg-blue-100 text-blue-800',
  completed: 'bg-green-100 text-green-800',
};

export default function TaskList({ tasks, onTaskUpdated, onTaskDeleted }) {
  const handleStatusChange = async (taskId, newStatus) => {
    try {
      const response = await client.patch(`/projects/${tasks[0].project_id}/tasks/${taskId}`, {
        task: { status: newStatus },
      });
      onTaskUpdated(response.data);
    } catch (err) {
      alert('Failed to update task');
    }
  };

  const handleDelete = async (taskId) => {
    if (!window.confirm('Delete this task?')) return;
    
    try {
      await client.delete(`/projects/${tasks[0].project_id}/tasks/${taskId}`);
      onTaskDeleted(taskId);
    } catch (err) {
      alert('Failed to delete task');
    }
  };

  if (tasks.length === 0) {
    return (
      <div className="bg-white rounded-lg shadow p-6 text-center text-gray-500">
        No tasks yet
      </div>
    );
  }

  return (
    <div className="space-y-3">
      {tasks.map(task => (
        <div
          key={task.id}
          className="bg-white rounded-lg shadow p-4 flex items-start justify-between"
        >
          <div className="flex-1">
            <h3 className="font-semibold text-gray-900">{task.title}</h3>
            {task.description && (
              <p className="text-gray-600 text-sm mt-1">{task.description}</p>
            )}
            <div className="mt-3 flex gap-2">
              <select
                value={task.status}
                onChange={(e) => handleStatusChange(task.id, e.target.value)}
                className={`text-xs px-2 py-1 rounded font-medium ${statusColors[task.status]}`}
              >
                <option value="pending">Pending</option>
                <option value="in_progress">In Progress</option>
                <option value="completed">Completed</option>
              </select>
            </div>
          </div>
          <button
            onClick={() => handleDelete(task.id)}
            className="text-red-600 hover:text-red-800 text-sm font-medium ml-4"
          >
            Delete
          </button>
        </div>
      ))}
    </div>
  );
}

