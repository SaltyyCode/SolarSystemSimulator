NAME = Solar_System

SRC = \
	src/main.c \
	src/renderer/window.c

OBJ = $(SRC:.c=.o)

OSFLAG :=

ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
	CC = gcc
	CFLAGS = -W -Wall -Wextra -g -I./include -IC:/raylib/raylib/src $(OSFLAG)
	LDFLAGS = -LC:/raylib/raylib/src -lraylib -lopengl32 -lgdi32 -lwinmm
	CLEAN_CMD = del /Q $(subst /,\,$(OBJ))
	FCLEAN_CMD = del /Q $(NAME).exe
	EXEC = $(NAME).exe
else
	UNAME_S := $(shell uname -s)
	UNAME_P := $(shell uname -p)

	ifeq ($(UNAME_S),Linux)
		OSFLAG += -D LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += -D OSX
	endif
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += -D AMD64
	endif
	ifneq ($(filter %86,$(UNAME_P)),)
		OSFLAG += -D IA32
	endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += -D ARM
	endif

	CC = gcc
	CFLAGS = -W -Wall -Wextra -g -I./include -I/usr/include $(OSFLAG)
	LDFLAGS = -L/usr/lib -lraylib -lm -ldl -lpthread -lGL -lX11
	CLEAN_CMD = rm -f $(OBJ)
	FCLEAN_CMD = rm -f $(NAME)
	EXEC = $(NAME)
endif

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC) $(CFLAGS) $(LDFLAGS)

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	$(CLEAN_CMD)

fclean: clean
	$(FCLEAN_CMD)

re: fclean all
