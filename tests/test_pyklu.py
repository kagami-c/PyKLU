import unittest
import pyklu
import numpy

class TestPyKLU(unittest.TestCase):
    def test_solve_linear_system(self):
        '''Tests the case in KLU tutorial

        where the test compress sparse matrix linear system are shown as below
            n = 5
            Ap = [0, 2, 5, 9, 10, 12]
            Ai = [0, 1, 0, 2, 4, 1, 2, 3, 4, 2, 1, 4]
            Ax = [2, 3, 3, -1, 4, 4, -3, 1, 2, 2, 6, 1]
            b = [8, 45, -3, 3, 19]
        and solve equation Ax = b
        '''
        A = numpy.array([[2, 3, 0, 0, 0], [3, 0, 4, 0, 6],
                         [0, -1, -3, 2, 0], [0, 0, 1, 0, 0],
                         [0, 4, 2, 0, 1]], dtype=numpy.double)
        b = numpy.array([8, 45, -3, 3, 19], dtype=numpy.double)
        pyklu.solve_linear_system(A, b)
        self.assertTrue(isinstance(b, numpy.ndarray))
        self.assertEqual(1, b.ndim)
        self.assertEqual(5, b.size)
        for x, y in zip(b, [1, 2, 3, 4, 5]):
            self.assertAlmostEqual(x, y)

