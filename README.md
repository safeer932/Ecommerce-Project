🌐 Mazon Online – Fullstack E-Grocery App (DevOps Microservices Project)

🚀 Deployment & Architecture (DevOps Cloud)
Feature	Description
🧱 Architecture	Microservices (Frontend, Backend, MySQL)
☁️ Cloud	Hybrid AWS (EC2) + GCP (GKE)
🐳 Docker	Containerized all services
☸️ Kubernetes	Deployments, Services, ConfigMaps, Secrets, Ingress
🔐 Security	HTTPS via Ingress + SSL, DNS with GoDaddy, sensitive info in ConfigMaps
🔁 CI/CD	GitLab pipelines (build → test → deploy)
⚙️ Terraform	EC2 provisioning + MySQL install automation
🧪 Debugging	Handled CORS, environment variables, inter-service communication


👨‍💻 Development Stack
Layer	Tech Stack
Frontend	React.js, Redux, CSS3
Backend	Node.js, Express.js, Sequelize
Database	MySQL (hosted on EC2)
ORM	Sequelize
Auth	JWT-based login system
API	RESTful API endpoints
✨ Features (User + Admin)

    🔐 User signup/login, password reset

    🛒 Add/remove from cart, checkout

    📄 Download receipt as PDF

    🔎 Product search

    🛠️ Admin: manage products & categories
