# Start Service with OTel Agent
# export span to console
opentelemetry-instrument --traces_exporter console --metrics_exporter none --logs_exporter none --service_name gateway flask run --port 3001

# export span to OTLP (Jaeger)
opentelemetry-instrument --traces_exporter otlp --metrics_exporter none --logs_exporter none --service_name gateway flask run --port 3001

# export span to OTLP (Grafana)
opentelemetry-instrument --traces_exporter otlp --metrics_exporter otlp --logs_exporter none --service_name gateway flask run --port 3001

# Enable OTel Log Instrumentation

## Mac/Linux
export OTEL_PYTHON_LOG_CORRELATION=true
export OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED=true

## Windows
set OTEL_PYTHON_LOG_CORRELATION=true
set OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED=true