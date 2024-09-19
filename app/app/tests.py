"""Sample test"""

from django.test import SimpleTestCase
from app import calc


class CalcTests(SimpleTestCase):
    """Test adding numbers together"""

    def test_add_numbers(self):
        """Test adding numbers together"""
        res = calc.add(5, 6)
        self.assertEqual(res, 11)

    def test_subtract_numbers(self):
        """Test subtracting numbers"""
        res = calc.subtract(5, 6)
        self.assertEqual(res, -1)

    def test_divide_numbers(self):
        """Test dividing numbers"""
        res = calc.divide(10, 5)
        self.assertEqual(res, 2)
