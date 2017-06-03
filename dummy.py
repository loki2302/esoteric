import unittest
import requests

class MyTest(unittest.TestCase):
  def testDummy(self):
    self.assertEqual(2+3, 5)

  def testRequests(self):
    response = requests.get('http://www.google.com')
    self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
  unittest.main()
