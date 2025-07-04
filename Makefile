NAME	= Solar_System

SRC	=	src/main.c \
		src/renderer/window.c

OBJ	= $(SRC:.c=.o)

INCLUDE_PATH = -I./include -IC:/raylib/raylib/src
LIB_PATH     = -LC:/raylib/raylib/src
LIBS         = -lraylib -lopengl32 -lgdi32 -lwinmm

CFLAGS	= -W -Wall -Wextra -g $(INCLUDE_PATH)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(OBJ) -o $(NAME) $(CFLAGS) $(LIB_PATH) $(LIBS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
