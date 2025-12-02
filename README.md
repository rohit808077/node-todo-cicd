Steps to Complete the Kubernetes Project:

1. Install KIND:
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind


2. Install kubectl & Docker:
kubectl:
curl -LO "https://dl.k8s.io/release/$(curl -L -s
https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
Install Docker Desktop from docker.com


3. Clone Repository:
git clone https://github.com/rohit808077/node-todo-cicd
cd node-todo-cicd


4. Create Dockerfile:
FROM node:18-alpine
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 8000
CMD ["npm", "start"]
Build Image:
docker build -t yourdockerhub/notes-app:latest .


5. Push to Docker Hub:
docker login
docker push yourdockerhub/notes-app:latest

6. Create Kubernetes YAML Files:
namespace.yml
deployment.yml
service.yml
Apply YAMLs:
kubectl apply -f namespace.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml


7. Port Forward:
kubectl port-forward service/notes-app -n notes-app 8000:8000 --address=0.0.0.0
Access Application:
http://localhost:8000 or your ec2 instace ip addrees 

