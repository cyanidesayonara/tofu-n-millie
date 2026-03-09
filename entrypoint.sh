#!/bin/bash
set -e

echo "Running migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Creating superuser if needed..."
export DJANGO_SUPERUSER_PASSWORD="${DJANGO_SUPERUSER_PASSWORD:-admin}"
python manage.py createsuperuser --noinput --username admin --email admin@example.com 2>/dev/null || true

echo "Starting Gunicorn..."
exec gunicorn tofu_n_millie_web.wsgi:application --bind 0.0.0.0:8000
