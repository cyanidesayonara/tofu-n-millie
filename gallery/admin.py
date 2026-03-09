from django.contrib import admin
from .models import Photo

@admin.register(Photo)
class PhotoAdmin(admin.ModelAdmin):
    list_display = ('title', 'pet', 'created_at')
    list_filter = ('pet',)
    search_fields = ('title',)
