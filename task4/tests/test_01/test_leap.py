from simple_library_01.functions import is_leap
import pytest

def test_add():
    assert True == is_leap(4)
    assert False == is_leap(200)
    assert False == is_leap(2022)
    assert False == is_leap(1)
    with pytest.raises(AttributeError):
        is_leap(0)
    assert True == is_leap(2000)

