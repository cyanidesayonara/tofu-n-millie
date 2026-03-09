FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set working directory
WORKDIR /app

# Install system dependencies for psycopg2 and Pillow
RUN apt-get update \
    && apt-get install -y gcc python3-dev libpq-dev libjpeg-dev zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY . /app/

# Expose port
EXPOSE 8000

# Run gunicorn
# In production, we assume static files were already collected or are served by nginx/whitenoise
# For simple deployment without external static hosting, we'll start with standard runserver
# or gunicorn if we configure whitenoise.
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "tofu_n_millie_web.wsgi:application"]
