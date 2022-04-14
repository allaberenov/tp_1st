from simple_library_01.functions import get_month_days
import pytest

def test_add():

    assert 28 == get_month_days(1931, 2)
    assert 29 == get_month_days(2000, 2)
    assert 30 == get_month_days(2000, 4)
    assert 30 == get_month_days(1930, 4)
    assert 31 == get_month_days(2021, 7)
    with pytest.raises(AttributeError):
        get_month_days(2000, 14)