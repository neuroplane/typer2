#!/bin/bash
clear
echo -e "Выбери мультфильм, который хочешь посмотреть:"
echo -e "1.\tФиксики \n2.\tТрансформеры \n3.\tЩенячий патруль"
read mchoice
		if [ "$mchoice" = "1" ]; then
			clear
			echo "Ты выбрал Фиксиков!Letters"
			SECONDS=456
			duration=$SECONDS
			echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
		elif [ "$mchoice" = "2" ]; then
			clear
			echo "Ты выбрал Трансформеров.Digits"
		else
			clear
			echo "Ты выбрал Щенячий патруль.Count"
fi
