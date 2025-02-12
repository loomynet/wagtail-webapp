FROM python:3.12-slim-bookworm

RUN useradd wagtail

EXPOSE 80

ENV PYTHONUNBUFFERED=1 \
    PORT=80 \
    DJANGO_SETTINGS_MODULE=mysite.settings.base

RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    libpq-dev \
    libmariadb-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev \
    nodejs \
    gettext \
    curl \
 && rm -rf /var/lib/apt/lists/*

RUN pip install "gunicorn==20.0.4"

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /app

RUN chown wagtail:wagtail /app

COPY --chown=wagtail:wagtail . /app

USER wagtail

RUN python manage.py collectstatic --noinput --clear

RUN python manage.py migrate

CMD ["sh", "-c", "export PYTHONPATH=/app && gunicorn --bind 0.0.0.0:80 mysite.wsgi:application"]

