# Simple C Wrapper Makefile. Provide routine for solving linear system.

default: all

CC = gcc

LIBPATH = ./temp/SuiteSparse-4.4.4/SuiteSparse

INCLUDE = -I$(LIBPATH)/KLU/Include \
          -I$(LIBPATH)/AMD/Include \
          -I$(LIBPATH)/BTF/Include \
          -I$(LIBPATH)/COLAMD/Include \
          -I$(LIBPATH)/SuiteSparse_config

LIB = $(LIBPATH)/KLU/Lib/libklu.a \
      $(LIBPATH)/BTF/Lib/libbtf.a \
	  $(LIBPATH)/AMD/Lib/libamd.a \
      $(LIBPATH)/COLAMD/Lib/libcolamd.a \
      $(LIBPATH)/SuiteSparse_config/libsuitesparseconfig.a

all: prelude pyKLU

prelude:
	(cd $(LIBPATH)/KLU/Lib/ && make CC=gcc)
	(cd $(LIBPATH)/AMD/Lib/ && make CC=gcc)
	(cd $(LIBPATH)/BTF/Lib/ && make CC=gcc)
	(cd $(LIBPATH)/COLAMD/Lib/ && make CC=gcc)
	(cd $(LIBPATH)/SuiteSparse_config/ && make CC=gcc)

pyKLU: pyklu.c $(LIB)
	$(CC) -shared pyklu.c $(LIB) $(INCLUDE) -o libpyklu.so

