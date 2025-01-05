#1st run mongo via docker
docker run -d -p 27017:27017 --name mongo mongo:latest


#2nd run node-frontend
cd node-frontend
npm i
npm run start

#3rd run node-service-blue
cd node-service-blue
npm i
npm run start

---
#set up python env
cmd + shift + p -> python: select interpreter  -> python3.xx -> select create env -> select Venv -> Python 3.xx -> select python project

#4rd run python-service-gateway
cd python-service-gateway
flask run --port 3001

#4rd run python-service-green
cd python-service-green
flask run --port 3010