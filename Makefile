# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: logkoege <logkoege@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 23:52:54 by logkoege          #+#    #+#              #
#    Updated: 2024/10/09 15:14:47 by logkoege         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS = -Wall -Werror -Wextra
CC = gcc
CLIENT = client
SERVER = server
PRINTF_SRC = ft_printf.c			\
		ft_print_char.c		\
		ft_print_str.c		\
		ft_print_ptr.c		\
		ft_print_nbr.c		\
		ft_print_unsigned.c	\
		ft_print_hex.c		\
		ft_print_percent.c	\

all: $(CLIENT) $(SERVER)

$(CLIENT): client.c $(PRINTF_SRC)
	$(CC) $(CFLAGS) client.c $(PRINTF_SRC) -o $(CLIENT)

$(SERVER): server.c $(PRINTF_SRC)
	$(CC) $(CFLAGS) server.c $(PRINTF_SRC) -o $(SERVER)

fclean:
	rm -rf $(CLIENT) $(SERVER)

re: fclean all
