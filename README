# PyKLU

A Python binding for KLU solver in SuiteSparse(http://faculty.cse.tamu.edu/davis/suitesparse.html)

Copyright (C) 2015 kagami-c and licensed under LGPL-2.1

## Introduction

This library provide a Python binding for KLU solver. At this time, we
just implement a wrapper for solving linear system. Other solvers will
be implemented in later version.

For better compatibility with scientific computing modules in Python
community, this modules is designed for NumPy ndarray input. We
strongly recommend to do the front-end computation in NumPy.

## Dependencies

- [SuiteSparse](http://faculty.cse.tamu.edu/davis/suitesparse.html)
- NumPy
- SciPy

## Installation

1. Get [SuiteSparse](http://faculty.cse.tamu.edu/davis/suitesparse.html)
source code and extract it in temp/ subfolder. The final path is like
PyKLU/temp/SuiteSparse-4.4.4/SuiteSparse/..

2. Type `make` in root folder (in PyKLU/) and it will automatically build
SuiteSparse library and PyKLU simple wrapper. There should be a shared
library in root folder of this project.

3. Delete all files in temp/ folder.

4. Feel free to enjoy this wrapper.

## Usage

In this stage, we just provide a wrapper in local and have not install it
in global paths. So feel free to put this script and shared library in any
other location. When finishing building, all necessities are `pyklu.py` and
`libpyklu.so`.

In your own project, you can use this binding like this.

```python
import numpy
from pyklu import solve_linear_system
A = numpy.array([[2, 3, 0, 0, 0], [3, 0, 4, 0, 6],
                 [0, -1, -3, 2, 0], [0, 0, 1, 0, 0],
                 [0, 4, 2, 0, 1]], dtype=numpy.double)
b = numpy.array([8, 45, -3, 3, 19], dtype=numpy.double)
solve_linear_system(A, b)
print(b)
```

Enjoy the speed of solving sparse linear systems~

## ATTENTION!

solve_linear_system() will return the result of x in equation Ax = b.
While the input argument b will be modified to x, which means that
x equals b when solver finish, and they are all pointing to the answer.

## LICENSE

SuiteSparse is licensed under LGPL-2.1.
This binding library (PyKLU) is released under LGPL-2.1.

