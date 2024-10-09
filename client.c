/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: logkoege <logkoege@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/18 13:56:18 by logkoege          #+#    #+#             */
/*   Updated: 2024/10/10 00:14:13 by logkoege         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

char	*ft_strcpy(char *dest, char *src)
{
	int	i;

	i = 0;
	while (src[i] != '\0')
	{
		dest[i] = src[i];
		i++;
	}
	dest[i] = '\0';
	return (dest);
}

int	ft_atoi(char *str)
{
	int	i;
	int	nombre;
	int	signe;

	i = 0;
	nombre = 0;
	signe = 1;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == ' ')
		i++;
	if (str[i] == '-' || str[i] == '+')
	{
		if (str[i] == '-')
			signe = -signe;
		i++;
	}
	while (str[i] && str[i] >= '0' && str[i] <= '9')
	{
		nombre = nombre * 10 + (str[i] - '0');
		i++;
	}
	return (nombre * signe);
}

void	ft_atob(int pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((c & (0x01 << bit)))
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(20);
		bit++;
	}
}

int	main(int argc, char **argv)
{
	int		pid;
	int		i;
	char	*message;

	if (argc != 3)
	{
		write(1, "Error\n", 6);
		return (1);
	}
	message = malloc(sizeof(char) * (ft_strlen(argv[2]) + 1));
	if (!message)
		return (1);
	ft_strcpy(message, argv[2]);
	pid = ft_atoi(argv[1]);
	i = 0;
	while (message[i])
	{
		ft_atob(pid, message[i]);
		i++;
	}
	free(message);
	return (0);
}
