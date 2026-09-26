
CC = gcc
CFLAGS_O0 = -O0 -Wall
CFLAGS_O3 = -O3 -Wall

all: varredura matmul pthreads

varredura:
	$(CC) $(CFLAGS_O3) varredura_linha.c util.c -o varredura_linha
	$(CC) $(CFLAGS_O3) varredura_coluna.c util.c -o varredura_coluna

matmul:
	$(CC) $(CFLAGS_O0) matmul_padrao.c util.c -o matmul_padrao_O0
	$(CC) $(CFLAGS_O3) matmul_padrao.c util.c -o matmul_padrao_O3
	$(CC) $(CFLAGS_O0) matmul_bloco.c util.c -o matmul_bloco_O0
	$(CC) $(CFLAGS_O3) matmul_bloco.c util.c -o matmul_bloco_O3

pthreads:
	$(CC) $(CFLAGS_O3) matmul_pthreads.c util.c -o matmul_pthreads -lpthread
	$(CC) $(CFLAGS_O3) matmul_pthreads_bloco.c util.c -o matmul_pthreads_bloco -lpthread

clean:
	rm -f varredura_linha varredura_coluna \
	      matmul_padrao_O0 matmul_padrao_O3 \
	      matmul_bloco_O0 matmul_bloco_O3 \
	      matmul_pthreads matmul_pthreads_bloco

