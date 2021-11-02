/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ppetchda <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/26 23:52:59 by porrapat          #+#    #+#             */
/*   Updated: 2021/10/26 23:53:55 by porrapat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

int	count_occur(char *str, char *charset);
char	**ft_split(char *str, char *charset);

int		main(int argc, char **argv)
{
	int		index;
	char	**split;

	if(argc == 3)
	{
		printf("count occ: %d\n", count_occur("  a  b   b   ", " a   "));
		//split = ft_split("ImtmVrV6Ov8QrkGGUglBy7Vgsu iIsdl5XyT35Czv4xeu", "yenORYQ");
		split = ft_split(argv[1], argv[2]);
		index = 0;
		printf("tab start\n");
		while (split[index])
		{
			printf("tab[%d]: $%s$\n", index, split[index]);
			fflush(stdout);
			index++;
		}
		printf("tab end\n");
	}
}
