# CAP Docker Demo

![GitHub](https://img.shields.io/github/license/katansapdevelop/cap-docker-demo)
![GitHub stars](https://img.shields.io/github/stars/katansapdevelop/cap-docker-demo)
![GitHub forks](https://img.shields.io/github/forks/katansapdevelop/cap-docker-demo)
![GitHub issues](https://img.shields.io/github/issues/katansapdevelop/cap-docker-demo)
![Docker](https://img.shields.io/badge/docker-enabled-blue)
![SAP CAP](https://img.shields.io/badge/SAP-CAP-0FAAFF)

A comprehensive SAP Cloud Application Programming (CAP) model project demonstrating Docker containerization, UI5 integration, and Cloud Foundry deployment on SAP Business Technology Platform (BTP).

## 📋 Overview

This project showcases a full-stack CAP application with:
- **Backend Services**: CAP-based OData services with external integration
- **Database Layer**: CDS data models and persistence
- **UI5 Frontend**: Fiori Elements application for monitoring flows
- **Docker Support**: Containerization for local and cloud deployment
- **BTP Integration**: Cloud Foundry deployment with destination services

## ✨ Features

- 🔄 Integration Content monitoring service
- 📊 Job scheduling and management
- 🎨 SAPUI5/Fiori Elements frontend
- 🐳 Docker containerization
- ☁️ SAP BTP Cloud Foundry deployment
- 🔐 OAuth2 destination support
- 🔧 Hybrid debugging capabilities

## 📁 Project Structure

File or Folder | Purpose
---------|----------
`app/` | UI5 Fiori applications and frontend content
`app/docker-demo/` | Main Fiori Elements application for monitoring flows
`db/` | CDS domain models and database schemas
`db/schema.cds` | Core data model definitions
`srv/` | Service definitions and implementations
`srv/job-service.cds` | Job service model
`srv/job-service.js` | Service implementation logic
`srv/external/` | External service definitions and metadata
`test/` | Test data and test suites
`Dockerfile` | Docker container configuration
`mtad.yaml` | Multi-target application descriptor for BTP
`package.json` | Node.js dependencies and scripts

## 🚀 Prerequisites

- Node.js (v18 or later)
- npm or yarn
- @sap/cds-dk (SAP CAP Development Kit)
- Docker (for containerization)
- Cloud Foundry CLI (for BTP deployment)
- SAP BTP account with Cloud Foundry environment

## 🛠️ Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/katansapdevelop/cap-docker-demo.git
   cd cap-docker-demo
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   cds watch
   ```
   Or use VS Code: _**Terminal** > Run Task > cds watch_

4. **Access the application**
   - Backend services: http://localhost:4004
   - Fiori app: http://localhost:4004/docker-demo/webapp/index.html


## Learn More

Learn more at https://cap.cloud.sap.


## Docker Image

Build the container
```shell
docker build -t cap-docker-demo:latest .
```


Run Locally
```shell
docker run --name cap-docker-demo -p 4004:4004 cap-docker-demo:latest
```


Push to Docker Hub.  Need to login via docker login
```shell
docker tag cap-docker-demo:latest katan/cap-docker-demo:latest
docker push katan/cap-docker-demo:latest
```


## ☁️ Cloud Foundry Deployment on SAP BTP

### Prerequisites

- SAP BTP Cloud Foundry environment
- Cloud Foundry CLI installed and configured
- Multi-target application (MTA) build tool

### Deployment Steps

1. **Login to Cloud Foundry**
   ```bash
   cf login -a <api-endpoint>
   ```

2. **Build the MTA archive** (if needed)
   ```bash
   mbt build
   ```

3. **Deploy to Cloud Foundry**
   ```bash
   cf deploy ./
   ```

The deployment uses the `mtad.yaml` descriptor file to deploy all modules and configure services.

### Post-Deployment

- Verify deployment: `cf apps`
- Check logs: `cf logs cap-docker-demo --recent`
- Access the application via the assigned route



## 🔧 Debugging & Hybrid Development

### Hybrid Testing with Cloud Services

For testing OAuth2 destinations locally while connected to BTP services:

1. **Create a service key for the destination service**
   ```bash
   cf create-service-key cap-docker-demo-destinations katan-hybrid-debug
   ```

2. **Bind the local application to the cloud service**
   ```bash
   cds bind destination --to cap-docker-demo-destinations:katan-hybrid-debug
   ```

3. **Run in hybrid mode**
   ```bash
   cds serve all --with-mocks --in-memory? --profile hybrid
   ```

### VS Code Debug Configuration

Add this configuration to `.vscode/launch.json` for hybrid debugging:

```json
{
    "name": "watch hybrid",
    "request": "launch",
    "type": "node",
    "cwd": "${workspaceFolder}",
    "envFile": "${workspaceFolder}/.env",
    "runtimeExecutable": "cds",
    "args": [
        "watch"
    ],
    "env": {
        "CDS_ENV": "hybrid",
        "PORT": "4004"
    },
    "skipFiles": [
        "<node_internals>/**"
    ]
}
```

### Troubleshooting

- **Destination caching issues**: Restart VS Code to clear cached destinations
- **OAuth2 authentication**: Ensure service keys are properly bound
- **Port conflicts**: Check that port 4004 is available

## 📚 Learn More

- [SAP Cloud Application Programming Model](https://cap.cloud.sap)
- [SAP Fiori Elements](https://ui5.sap.com/fiori-elements)
- [Docker Documentation](https://docs.docker.com)
- [Cloud Foundry Documentation](https://docs.cloudfoundry.org)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with** ❤️ **using SAP CAP, SAPUI5, and Docker**