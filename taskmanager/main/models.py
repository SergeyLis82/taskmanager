from django.db import models

# Create your models here.
class Task(models.Model):
    title = models.CharField('Название', max_length=100)
    task = models.TextField('Описание')
    create_time = models.TimeField('Время создания', auto_now=True)
    create_date = models.DateField('Дата создания', auto_now=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        verbose_name = "Задача"
        verbose_name_plural = "Задачи"