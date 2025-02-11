FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=WebSite.settings
ENV PYTHONPATH="/app"

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libpq-dev \
    nodejs \
    gettext \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

COPY . /app/

# RUN python manage.py collectstatic --noinput

# RUN python manage.py migrate

WORKDIR /app/WebSite

EXPOSE 80

CMD ["gunicorn", "--bind", "0.0.0.0:80", "WebSite.wsgi:application"]
