FROM python:3.12-slim

WORKDIR /app

# Update OS packages to reduce known vulnerabilities
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application source
COPY . .

# Flask port
EXPOSE 5000

# Start Flask application
CMD ["python", "app.py"]