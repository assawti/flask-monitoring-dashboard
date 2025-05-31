# Dockerfile

FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port (only needed if you want to expose from container)
EXPOSE 8000

# Run Gunicorn with unix socket
CMD ["gunicorn", "--workers", "3", "--bind", "unix:/tmp/app.sock", "app:app"]

