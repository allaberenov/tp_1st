from weather_03 import weather_wrapper
import pytest
import os

def test_add():
    weather_wrapper.WeatherWrapper('http://api.openweathermap.org/data/2.5/weather')