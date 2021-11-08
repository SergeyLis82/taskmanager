from .models import Task
from django.forms import ModelForm, TextInput, Textarea

class TaskForm(ModelForm):
    class Meta:
        model = Task
        fields = ["title", "task"]
        widgets = {
            "title": TextInput(attrs={
                "placeholder": "Название задачи",
                "class": "form-control"
            }),
            "task": Textarea(attrs={
                "placeholder": "Описание задачи",
                "class": "form-control"
            })
        }