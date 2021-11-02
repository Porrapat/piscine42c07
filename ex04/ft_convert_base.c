/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_convert_base.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ppetchda <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/26 23:52:59 by porrapat          #+#    #+#             */
/*   Updated: 2021/10/26 23:53:55 by porrapat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdbool.h>
#include <stdlib.h>

#define NO_MATCH -1

int		ft_str_length(char *str);
int		compute_number_length(unsigned int number, int radix, bool negative);
bool	is_space(char c);
bool	is_base_valid(char *str);

int	resolve_base(char *base, char match)
{
	int		index;

	index = 0;
	while (base[index])
	{
		if (base[index] == match)
			return (index);
		index++;
	}
	return (NO_MATCH);
}

char	*ft_buffer_base(char *base, unsigned int number, bool negative)
{
	int		index;
	int		radix;
	int		length;
	char	*string;

	radix = ft_str_length(base);
	length = compute_number_length(number, radix, negative);
	string = (char *)malloc((length + 1) * sizeof(char));
	if (!string)
		return (0);
	if (negative)
		string[0] = '-';
	if (negative)
		index = 1;
	else
		index = 0;
	while (index < length)
	{
		string[length - (!negative) - index++] = base[number % radix];
		number /= radix;
	}
	string[length] = '\0';
	return (string);
}

unsigned int	shif(int resol, unsigned int result, char *nbr, char *base_from)
{
	int	radix;

	radix = ft_str_length(base_from);
	resol = resolve_base(base_from, *nbr);
	while (resol != NO_MATCH)
	{
		result *= radix;
		result += resol;
		nbr++;
		resol = resolve_base(base_from, *nbr);
	}
	return (result);
}

char	*ft_convert_base(char *nbr, char *base_from, char *base_to)
{
	int				minus;
	int				resolved;
	unsigned int	result;
	bool			is_not_minus;

	if (!is_base_valid(base_from) || !is_base_valid(base_to))
		return (NULL);
	minus = 1;
	while (is_space(*nbr))
		nbr++;
	while (*nbr == '+' || *nbr == '-')
	{
		if (*(nbr++) == '-')
			minus *= -1;
	}
	result = 0;
	resolved = 0;
	result = shif(resolved, result, nbr, base_from);
	if (result == 0)
		minus = 1;
	if (minus > 0)
		is_not_minus = false;
	else
		is_not_minus = true;
	return (ft_buffer_base(base_to, result, is_not_minus));
}
