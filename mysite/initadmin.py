import os
import time
import django
from django.core.exceptions import ImproperlyConfigured
from django.db.utils import OperationalError
from django.contrib.auth import get_user_model

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")
django.setup()

attempts = 5
while attempts > 0:
    try:
        User = get_user_model()
        break
    except (ImproperlyConfigured, OperationalError) as e:
        print(f"Database not ready. Retrying in 5 seconds... ({attempts} attempts left)")
        time.sleep(5)
        attempts -= 1

if attempts == 0:
    print("Database not ready. Exiting script.")
    exit(1)

username = os.getenv("ADMIN_USERNAME")
email = os.getenv("ADMIN_EMAIL")
password = os.getenv("ADMIN_PASSWORD")

if username and password:
    if not User.objects.filter(username=username).exists():
        User.objects.create_superuser(username=username, email=email, password=password)
        print("Superuser created successfully!")
    else:
        print("Superuser already exists.")
else:
    print("Missing admin credentials. Skipping superuser creation.")
