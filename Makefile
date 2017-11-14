# swtest
# Simple examples for understanding the usage of xv6 swtch
# Copyright (C) 2017 Takuo Watanabe

LIB_SRCS = context.c mythread.c
ASM_SRCS = swtch.S
EXE_SRCS = swtest.c schtest.c thtest1.c
LIB_OBJS = $(LIB_SRCS:%.c=%.o) $(ASM_SRCS:%.S=%.o)
ALL_OBJS = $(EXE_SRCS:%.c=%.o) $(LIB_OBJS)
EXES = swtest schtest thtest1

CC = gcc
CPPFLAGS =
CFLAGS = -std=c99 -pedantic -Wall -Wextra -Werror -g -m32 -mstackrealign
LDFLAGS =
RM = rm -f

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

%.o: %.S
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

.PHONY: all clean allclean

all: $(EXES)

swtest: $(LIB_OBJS) swtest.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

schtest: $(LIB_OBJS) schtest.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

thtest1: $(LIB_OBJS) thtest1.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	$(RM) $(EXES)
	$(RM) context.o swtch.o swtest.o schtest.o thtest1.o

allclean: clean
	$(RM) a.out
	$(RM) -r *.dSYM
	$(RM) *~
