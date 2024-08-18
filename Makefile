# Definições de variáveis
CC = g++
CFLAGS = -std=c++11 -Iinclude -Wall -Wextra
LDFLAGS =

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
INCLUDE_DIR = include

# Lista de arquivos fonte e objeto
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Nome do executável
EXEC = $(BIN_DIR)/pa5.out

# Regra padrão
all: $(EXEC)

# Regra para construir o executável
$(EXEC): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

# Regra para construir arquivos objeto
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Limpeza dos arquivos compilados
clean:
	rm -f $(OBJ_DIR)/*.o $(EXEC)

# Limpeza total
fclean: clean
	rm -f $(EXEC)

# Regra para recompilar
re: fclean all

.PHONY: all clean fclean re
