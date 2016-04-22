from django.shortcuts import render
from django.views.generic.base import TemplateView
from racing import models


class DumpView(TemplateView):

    template_name = "dump.html"

    def get_context_data(self, **kwargs):
        context = super(DumpView, self).get_context_data(**kwargs)
        context['leagues'] = models.League.objects.all()
        context['seasons'] = models.Season.objects.all()
        context['events'] = models.Event.objects.all()
        context['races'] = models.Race.objects.all()
        context['teams'] = models.Team.objects.all()
        context['cars'] = models.Car.objects.all()
        context['people'] = models.Person.objects.all()
        return context
