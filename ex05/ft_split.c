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

int	is_sep(char c, char *charset)
{
	int	j;

	j = 0;
	while (charset[j])
	{
		if (c == charset[j])
			return (1);
		j++;
	}
	return (0);
}

char	*strsub(char *s, int len)
{
	char	*res;
	int		i;

	res = malloc((len + 1) * sizeof(char));
	i = 0;
	while (i < len)
	{
		res[i] = s[i];
		i++;
	}
	res[i] = 0;
	return (res);
}

int	count_separator(char *str, char *charset)
{
	int	i;
	int	n;

	i = 0;
	n = 1;
	while (str[i])
	{
		if (is_sep(str[i++], charset))
			n++;
	}
	return (n);
}

char	**ft_split(char *str, char *charset)
{
	char	**res;
	int		n;
	int		idx;
	int		start;
	int		i;

	start = 0;
	idx = 0;
	i = 0;
	n = count_separator(str, charset);
	res = malloc((n + 1) * sizeof(char *));
	while (str[i])
	{
		if (!is_sep(str[i], charset) && i > 0 && is_sep(str[i - 1], charset))
			start = i;
		if (is_sep(str[i], charset) && i > 0 && !is_sep(str[i - 1], charset))
			res[idx++] = strsub(str + start, i - start);
		else if (!str[i + 1] && !is_sep(str[i], charset))
			res[idx++] = strsub(str + start, i - start + 1);
		i++;
	}
	res[idx] = 0;
	return (res);
}
