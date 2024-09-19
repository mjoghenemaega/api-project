"""
sample test 
"""

from django.test import SimpleTestCase

from app import calc


class CalcTests(SimpleTestCase):
    """ Test adding nmbers toghether """
    
    def test_add_numbers(self):
        """ test adding number toghther """
        res = calc.add(5,6)
        
        self.assertEqual(res , 11)
        
        
    
    def test_substract_numbers(self):
        """ test adding number toghther """
        res = calc.substract(5,6)
        
        self.assertEqual(res , -1)  
     
    def test_devide_numbers(self):
        """ testing TDD on divide """
        
        res = calc.divide(10, 5)
        self.assertEqual(res, 2)         