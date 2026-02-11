# Getting Started

Welcome to your new CAP project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


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


## Deploying app to CF on BTP

From the root dir run...
```shell
cf deploy ./
```



## Debugging
After deployment had to run locally and use hybrid debugging for OAuth2 destinations to work.

Need to create a new service key and bind local to the dest service using the new key.  Then run in hybrid debugging.  Any issues with caching destinations, restart VS Code.

```
cf create-service-key cap-docker-demo-destinations katan-hybrid-debug

cds bind destination --to cap-docker-demo-destinations:katan-hybrid-debug

cds serve all --with-mocks --in-memory? --profile hybrid 
```


VS Code Debug Config
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