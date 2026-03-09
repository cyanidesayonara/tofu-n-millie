from django.shortcuts import render
from .models import Photo

def index(request):
    photos = Photo.objects.all().order_by('-created_at')
    return render(request, 'gallery/index.html', {'photos': photos})
