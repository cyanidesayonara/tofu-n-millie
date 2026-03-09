from django.db import models

class Photo(models.Model):
    PET_CHOICES = [
        ('tofu', 'Tofu'),
        ('millie', 'Millie'),
        ('both', 'Both')
    ]
    
    image = models.ImageField(upload_to='photos/')
    title = models.CharField(max_length=100, blank=True)
    pet = models.CharField(max_length=10, choices=PET_CHOICES)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.pet.capitalize()} - {self.title or 'Untitled'}"
