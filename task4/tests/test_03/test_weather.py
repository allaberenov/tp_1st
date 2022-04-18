from weather_03 import weather_wrapper

import pytest
import requests_mock
import os
import requests

APPID = os.environ['APPID']


def test_add():
    weather = weather_wrapper.WeatherWrapper(APPID)

    with pytest.raises(AttributeError):
        weather.get_response_city("Turgistan", weather_wrapper.BASE_URL)

    with requests_mock.Mocker(real_http=True) as moc:
        moc.register_uri('GET', URL_BASE, text='resp')
        weather.get_tomorrow_temperature("London")
        weather.find_diff_two_cities("Ashgabat", "London")
        weather.get_diff_string("Ashgabat", "London")
        weather.get_diff_string("Moscow", "London")
        weather.get_tomorrow_diff("Ashgabat")
        weather.get_tomorrow_diff("London")
        weather.get_tomorrow_diff("Sankt Peterburg")
        weather.get_tomorrow_diff("Iceland")
