
#!/bin/bash
#Сразу делаем список файлов в директории /videos и записываем его в файл
ls /home/pi/typer/videos/ > videos.txt
clear
echo -e "\n\n"
x=0
#Задаем количество необходимых успешных попыток ввода:
z=10
while [ $x -lt $z ]
        do
                word=$(shuf -n 1 words.txt)
                echo -e "REPEAT: \033[33m$word\033[0m"
                read vari
                if [ "$vari" = "$word" ]; then
                        clear
                        x=$(( $x + 1 ))
                        y=$(( $z - $x))
                        echo -e "\033[42m\033[30mCORRECT! ENTRIES LEFT:$y\nSECONDS PASSED: $SECONDS\n\033[0m"
                else
                        clear
                        y=$(( $z - $x))
                        echo -e "\033[41m\033[30mINCORRECT! ENTRIES LEFT: $y\nSECONDS PASSED: $SECONDS\n\033[0m"
                fi
        done
#Для статистики и контроля выводим количество затраченных секунд
clear
(( passed = $SECONDS / $z))
echo "TOOK $passed SECONDS"
echo $passed >> seconds.t
#Выбираем случайную строку из списка видеофайлов
videofile=$(shuf -n 1 videos.txt)
#Задаем директорию, содержащую видео файлы
videodir=/home/pi/typer/videos/
#treelines = $(tree -id | wc -l)
#dirlist = $(sed "2,$treelines)
echo $dirlist
#И отправляем это все в видеопроигрыватель omxplayer
omxplayer -b --no-keys $videodir$videofile
#После проигрывания запускаем скрипт заново
./while.sh
