# Task Share - Rails Monolith with React SPA

A professional full-stack project management application - **single Rails app** with integrated React frontend, PostgreSQL database, and Tailwind CSS styling.

## 🚀 Quick Start

```bash
cd api
bundle install && npm install
rails db:create db:migrate db:seed
```

**Then run 3 terminals:**
```bash
# Terminal 1
npm run dev

# Terminal 2
npm run watch:css

# Terminal 3
rails server
```

**Open:** http://localhost:3000

---

## 📋 Features

✅ **Create Projects** - Title and description  
✅ **Manage Tasks** - Add, update status, delete  
✅ **Task Status** - Pending → In Progress → Completed  
✅ **Responsive UI** - Works on mobile, tablet, desktop  
✅ **Clean Code** - Professional architecture  
✅ **PostgreSQL** - Robust database with proper indexes  

---

## 🏗️ Architecture

**Single Rails Application** with:
- **React SPA** in `app/javascript/` (client-side routing)
- **RESTful API** in `app/controllers/api/v1/` (JSON endpoints)
- **Rails Models** in `app/models/` (business logic)
- **PostgreSQL** database with migrations
- **Tailwind CSS** for styling
- **esbuild** for JavaScript bundling

```
┌─────────────────────┐
│   Browser (React)   │
│  - React Router     │
│  - Components       │
│  - Tailwind CSS     │
└──────────────┬──────┘
               │ HTTP/JSON
        ┌──────▼─────────┐
        │  Rails Server  │
        │  - API (/v1)   │
        │  - Models      │
        │  - Database    │
        └────────────────┘
```

---

## 📁 Project Structure

```
api/                              # Rails monolith
├── app/
│   ├── javascript/               # React frontend
│   │   ├── entrypoints/application.js
│   │   ├── pages/
│   │   │   ├── ProjectsPage.jsx
│   │   │   └── ProjectDetailPage.jsx
│   │   ├── components/
│   │   │   ├── ProjectForm.jsx
│   │   │   ├── ProjectList.jsx
│   │   │   ├── TaskForm.jsx
│   │   │   └── TaskList.jsx
│   │   ├── api/client.js         # Axios HTTP client
│   │   └── styles/application.css
│   ├── controllers/
│   │   ├── api/v1/
│   │   │   ├── projects_controller.rb
│   │   │   ├── tasks_controller.rb
│   │   │   └── users_controller.rb
│   │   └── pages_controller.rb   # Serves React app
│   ├── models/
│   │   ├── user.rb
│   │   ├── project.rb
│   │   └── task.rb
│   ├── serializers/
│   │   ├── user_serializer.rb
│   │   ├── project_serializer.rb
│   │   └── task_serializer.rb
│   └── views/
│       ├── layouts/application.html.erb  # React root
│       └── pages/index.html.erb
├── config/
│   ├── routes.rb                 # All routes
│   └── initializers/cors.rb      # CORS setup
├── db/
│   ├── migrate/                  # Database versions
│   └── seeds.rb                  # Sample data
├── Gemfile                       # Ruby dependencies
├── package.json                  # Node dependencies
├── tailwind.config.js            # Tailwind setup
├── esbuild.config.mjs            # JS bundler
└── postcss.config.js             # CSS processor
```

---

## 💻 Tech Stack

| Layer | Technology | Why |
|-------|-----------|-----|
| **Frontend** | React 19 + React Router | Modern, component-based |
| **Backend** | Rails 8.1 | Convention over config |
| **Database** | PostgreSQL | Robust, scalable |
| **Styling** | Tailwind CSS | Utility-first, fast |
| **Build** | esbuild + Tailwind CLI | Modern, performant |
| **Architecture** | Monolith | Simple, team-friendly |

---

## 🔄 How It Works

1. **Browser requests** `http://localhost:3000`
2. **Rails routes** to `pages_controller#index`
3. **Server renders** `application.html.erb` with `<div id="root">`
4. **React mounts** and handles client-side routing
5. **User clicks** → React Router navigates (no page reload)
6. **Form submit** → Axios calls `/api/v1/*` endpoints
7. **Rails controller** processes and returns JSON
8. **React updates** state and re-renders
9. **Tailwind CSS** styles everything

---

## 📡 API Endpoints

### Projects
```
GET    /api/v1/projects           # List all
POST   /api/v1/projects           # Create
GET    /api/v1/projects/:id       # Get one
PUT    /api/v1/projects/:id       # Update
DELETE /api/v1/projects/:id       # Delete
```

### Tasks
```
GET    /api/v1/projects/:id/tasks        # List
POST   /api/v1/projects/:id/tasks        # Create
PATCH  /api/v1/projects/:id/tasks/:task_id   # Update
DELETE /api/v1/projects/:id/tasks/:task_id   # Delete
```

### Users
```
POST   /api/v1/users              # Create
GET    /api/v1/users/:id          # Get
```

---

## 🛠️ Common Commands

### Setup
```bash
bundle install              # Install Ruby gems
npm install                 # Install Node packages
rails db:create            # Create database
rails db:migrate           # Run migrations
rails db:seed              # Add sample data
```

### Development
```bash
npm run dev                # Build JavaScript (watch)
npm run watch:css          # Build CSS (watch)
rails server               # Start Rails on :3000
rails console              # Interactive console
```

### Database
```bash
rails generate migration AddField
rails db:migrate
rails db:rollback
rails db:reset
```

### Production
```bash
npm run build              # Production JS build
npm run build:css          # Production CSS build
rails assets:precompile    # Precompile assets
RAILS_ENV=production rails server
```

---

## 🎯 Key Files

**React Entry:**
- `app/javascript/entrypoints/application.js` - Mounts React

**React Pages:**
- `app/javascript/pages/ProjectsPage.jsx` - List projects
- `app/javascript/pages/ProjectDetailPage.jsx` - Project + tasks

**React Components:**
- `app/javascript/components/` - Reusable UI pieces

**API:**
- `app/controllers/api/v1/` - JSON endpoints
- `app/models/` - Business logic & validation
- `app/serializers/` - JSON output format

**Database:**
- `db/migrate/` - Schema versions
- `db/seeds.rb` - Sample data

**Styling:**
- `app/javascript/styles/application.css` - Global Tailwind

---

## 🚨 Troubleshooting

### PostgreSQL error
```bash
brew services start postgresql    # macOS
sudo systemctl start postgresql   # Linux
```

### Port 3000 in use
```bash
rails server -p 3001              # Use different port
lsof -ti :3000 | xargs kill -9   # Kill process (macOS/Linux)
```

### JavaScript errors
```bash
rm -rf node_modules package-lock.json
npm install
npm run dev
```

### Database issues
```bash
rails db:drop db:create db:migrate db:seed
```

---

## 👥 Team Structure

**Perfect for 3-person team:**
- **2 Frontend Engineers** - Work in `app/javascript/`
- **1 Backend Engineer** - Work in `app/controllers/`, `app/models/`, `db/`
- **Communication** - Via RESTful API at `/api/v1/*`

**Single codebase means:**
✅ No separate API repo  
✅ One deployment target  
✅ Shared context  
✅ Easy to maintain  

---

## 📦 Production Deployment

```bash
# Build assets
npm run build
npm run build:css
rails assets:precompile

# Deploy Rails app normally (Heroku, AWS, etc)
git push heroku main
```

**Environment variables needed:**
```
DATABASE_URL=postgresql://user:pass@host/db
RAILS_ENV=production
SECRET_KEY_BASE=<generated>
```

---

## ✨ Code Quality

**This project demonstrates:**
- ✅ Clean architecture
- ✅ Rails best practices (models, controllers, serializers)
- ✅ React patterns (hooks, composition)
- ✅ Error handling
- ✅ Database design with migrations
- ✅ RESTful API design
- ✅ Responsive Tailwind CSS
- ✅ Professional folder structure

---

## 🚀 Development Workflow

### Adding a Feature

1. **Create React component** in `app/javascript/components/`
2. **Add API endpoint** in `app/controllers/api/v1/`
3. **Create model** in `app/models/` (if needed)
4. **Create migration** for database changes
5. **Create serializer** in `app/serializers/`
6. **Run migrations** `rails db:migrate`
7. **Test in browser** http://localhost:3000

### File Changes Are Automatic
- **JavaScript** → esbuild rebuilds (`npm run dev` terminal)
- **CSS** → Tailwind recompiles (`npm run watch:css` terminal)
- **Rails code** → Auto-reloads (`rails server` terminal)

---

## 🎓 Learning

To understand the codebase:

1. Open `app/javascript/pages/ProjectsPage.jsx` - See React component
2. See `client.js` - API calls to `/api/v1/projects`
3. Open `app/controllers/api/v1/projects_controller.rb` - API logic
4. Check `app/models/project.rb` - Database model
5. Check `db/migrate/` - Database schema
6. Check `app/serializers/project_serializer.rb` - JSON output

---

## 📊 Database Schema

**Users Table**
- id, name, email, encrypted_password, created_at, updated_at

**Projects Table**
- id, title, description, user_id, created_at, updated_at

**Tasks Table**
- id, title, description, status (pending/in_progress/completed), project_id, created_at, updated_at

---

## 🎨 UI/UX Features

✅ **Responsive Design** - Mobile, tablet, desktop  
✅ **Color-coded Tasks** - Yellow/Blue/Green status  
✅ **Click Navigation** - No page reloads  
✅ **Error Messages** - User-friendly  
✅ **Loading States** - Shows activity  
✅ **Confirmation Dialogs** - Safe deletions  
✅ **Professional Styling** - Tailwind CSS  

---

## 📞 Support

If something breaks:

1. Check if PostgreSQL is running
2. Check if `npm run dev` and `npm run watch:css` are running
3. Check Rails server logs
4. Try clearing builds: `rm -rf app/assets/builds/*`
5. Reinstall: `npm install && bundle install`

---

## 📚 Code Examples

### Creating a Project (React)

```jsx
const handleProjectCreated = (newProject) => {
  setProjects([...projects, newProject]);
};

// In ProjectForm.jsx
const response = await client.post('/api/v1/projects', {
  project: formData
});
onProjectCreated(response.data);
```

### Project Controller (Rails)

```ruby
def create
  project = Project.new(project_params)
  if project.save
    render json: project, serializer: ProjectSerializer, status: :created
  else
    render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
  end
end

private

def project_params
  params.require(:project).permit(:title, :description, :user_id)
end
```

### Project Model (Rails)

```ruby
class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
end
```

---

## ✅ Quick Checklist

Before you start:
- [ ] Ruby 3.x installed
- [ ] Node.js 18+ installed
- [ ] PostgreSQL installed and running
- [ ] `bundle install && npm install` done
- [ ] `rails db:create db:migrate db:seed` done
- [ ] 3 terminals running dev servers
- [ ] http://localhost:3000 opens and loads

---

## 🎉 You're Ready!

Everything is set up and ready to go. Open 3 terminals:

```bash
# Terminal 1
npm run dev

# Terminal 2
npm run watch:css

# Terminal 3
rails server
```

Then open **http://localhost:3000** and start building! 🚀

---

**Built with Rails 8.1, React 19, PostgreSQL, and Tailwind CSS.**
