# Use official Python image
FROM python:3.12-slim

# Set working directory inside container. if not exists create the app folder
WORKDIR /app

# Copy requirements file first (better caching)
COPY req.txt .

# Install dependencies
RUN pip install --no-cache-dir -r req.txt

# Copy source code
COPY src ./src

# Expose FastAPI port
EXPOSE 8000

# Run FastAPI using uvicorn
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]
