import os
import django
from django.core.exceptions import ImproperlyConfigured
from django.db.utils import OperationalError
from django.contrib.auth import get_user_model

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")
django.setup()

User = get_user_model()


username = os.getenv("ADMIN_USERNAME")
email = os.getenv("ADMIN_EMAIL")
password = os.getenv("ADMIN_PASSWORD")

if not username or not password:
    print("Missing admin credentials. Skipping superuser creation.")
    exit(1)

try:
    if not User.objects.filter(username=username).exists():
        User.objects.create_superuser(username, email, password)
        print("✅ Superuser created successfully!")
    else:
        print("⚠️ Superuser already exists.")
except (ImproperlyConfigured, OperationalError) as e:
    print(f"Error: {e}")
    exit(1)
