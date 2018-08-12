import requests
import numpy as np


def test_requests():
    response = requests.get('http://www.google.com')
    print('status is {}'.format(response.status_code))
    assert response.status_code == 200


def test_numpy():
    arr1 = np.array([1, 2, 3])
    arr2 = np.array([2, 2, 2])
    arr3 = arr1 + arr2
    print('arr 3 is {}'.format(arr3))
    assert np.array_equal(arr3, np.array([3, 4, 5]))
