# Stage 1: Build Stage
FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN python -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Stage 2: Production Stage
FROM python:3.9-slim

COPY --from=builder /opt/venv /opt/venv

WORKDIR /app

COPY . .

ENV PATH="/opt/venv/bin/:$PATH"

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]