# Dockerfile untuk menjalankan metpen-ai-lab di Docker Desktop
FROM python:3.11-slim

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Jupyter port (menggunakan port 8891 untuk menghindari konflik)
EXPOSE 8891

# Set environment variables
ENV JUPYTER_ENABLE_LAB=yes

# Start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8891", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
