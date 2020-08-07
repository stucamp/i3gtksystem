CC      = gcc
PKGCONFIG = $(shell which pkg-config)
OBJS    = ${SOURCES:.c=.o}
CFLAGS = $(shell $(PKGCONFIG) --cflags gtk+-3.0)
LIBS = $(shell $(PKGCONFIG) --libs  gtk+-3.0)
PACKAGE = i3sysdialog

SRC = main.c

OBJS = $(SRC:.c=.o)

all: i3sysdialog

%.o: %.c
	$(CC) -c -o $(@F) $(CFLAGS) $<

i3sysdialog: $(OBJS)
	$(CC) -o $(@F) $(OBJS) $(LIBS)

clean:
	rm -f $(BUILT_SRC)
	rm -f $(OBJS)
	rm -f i3sysdialog
