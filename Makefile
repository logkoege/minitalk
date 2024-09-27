# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: logkoege <logkoege@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 23:52:54 by logkoege          #+#    #+#              #
#    Updated: 2024/09/23 00:45:05 by logkoege         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS = -Wall -Werror -Wextra
CC = gcc
CLIENT = ft_client
SERVER = ft_server
PRINTF_SRC = printf/ft_printf.c			\
		printf/ft_print_char.c		\
		printf/ft_print_str.c		\
		printf/ft_print_ptr.c		\
		printf/ft_print_nbr.c		\
		printf/ft_print_unsigned.c	\
		printf/ft_print_hex.c		\
		printf/ft_print_percent.c	\

all: $(CLIENT) $(SERVER)

$(CLIENT): ft_client.c $(PRINTF_SRC)
	$(CC) $(CFLAGS) ft_client.c $(PRINTF_SRC) -o $(CLIENT)

$(SERVER): ft_server.c $(PRINTF_SRC)
	$(CC) $(CFLAGS) ft_server.c $(PRINTF_SRC) -o $(SERVER)

fclean:
	rm -rf $(CLIENT) $(SERVER)

re: fclean all
