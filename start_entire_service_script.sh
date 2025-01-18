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


#5th run Jaeger via docker
  # Command to start the Jaeger Docker container
  docker run -d --rm --name jaeger \
    -e COLLECTOR_OTLP_ENABLED=true \
    -p 5778:5778 \
    -p 16686:16686 \
    -p 4317:4317 \
    -p 4318:4318 \
    jaegertracing/all-in-one:1.54

  # Ports
  5778	HTTP	agent	serve configs (sampling, etc.)
  16686	HTTP	query	serve frontend
  4317	HTTP	collector	accept OpenTelemetry Protocol (OTLP) over gRPC
  4318	HTTP	collector	accept OpenTelemetry Protocol (OTLP) over HTTP


#start opentelemetry collector
#Jaeger collector config
./otelcol-contrib --config ./collector-config.yml

#Grafana collector config
./otelcol-contrib --config ./grafana-collector-config.yml