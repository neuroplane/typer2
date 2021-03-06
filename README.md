Этот скрипт делает простую вещь: предлагает пользователю ввести заданное количество рандомных строк из файла, после чего проигрывает рандомный видеофайл из папки videos.

Что нужно для работы:

1. Raspberry Pi 3 (но можно и постарше модель)
2. Карта Micro SD (SDHC) объемом 16-32Гб. Больше вам не нужно будет
3. Собственно телевизор или любой экран с возможностью подключения источника по HDMI
4. Кабель HDMI
5. Питание 5В-2А (или больше) по Micro USB. Это простая зарядка USB, но смотрите на силу тока. Если она будет ниже 2А, то Raspberry будет работать не в полную силу, а в правом верхнем углу покажется значок молнии, говорящий, что устройству недостаточно тока.
6. Внешняя клавиатура и мышь. Лично у меня модель клавиатуры со встроенным трекпадом, поэтому мышь не нужна.
    
Итак, все, что есть в списке вы раздобыли. Далее нужно произвести несколько манипуляций для установки системы

1. Создать загрузочную карту памяти. Для этого пройдите по ссылке https://downloads.raspberrypi.org/raspbian_latest. Вы скачаете .zip файл с последней версией операционной системы Raspbian.
2. Со страницы https://etcher.io/ скачайте программу Etcher и установите в систему Windows/Mac OS
3. Вставьте в кардридер карту SDHC 
4. Откройте программу Etcher, выберите файл из п.п.1, выберите в качестве носителя вашу карту, и нажмите на пуск (вы можете использовать любую другую удобную программу для создания загрузочного диска)
5. После успешного прожига вставьте карту в Raspberry Pi и подключите питание и клавиатуру

Вы увидите загрузочный экран с загружаемыми блоками системы. После установки и перезагрузки вы окажетесь в рабочем столе Raspbian. 

В зависимости от того, какой тип связи вы будете использовать, вам потребуется подключиться к беспроводной сети. Значок управления подключениями находится на панели справа. Просто нажмите на него и выберите свою Wi-Fi сеть и введите пароль от нее.

На панели вы увидите значок терминала. Запустите его.

1. В терминале введите команду, которая обновит всю систему:
    `sudo rpi-update`
2. После перезагрузки введите команду, которая скачает скрипт и нужные файлы:
    `git clone https://github.com/neuroplane/typer2`
3. После этого перейдите в папку скрипта:
    `cd typer2`
4. Создайте папку videos:
    `mkdir videos`
5. Запустите текстовый редактор и зайдите в сам файл скрипта:
    `nano typer.sh`
6. В файле вы можете задать 
    - количество попыток через изменение переменной z (8 строка)
    - директорию, где лежат файлы
    - файл, из которого будут браться строки
7. Выполните команду, которая сделает скрипт запускаемым:
    `chmod +x ./typer.sh`
    
Если вы не будете менять директорию с видеофайлами, то на панели откройте файловый менеджер, вставьте USB драйв в Raspberry Pi и простым выделением и перетаскиванием скопируйте нужные видеофайлы в папку videos. Имена файлов не должны содержать пробелы и спецсиволы типа ',",/ итд.

Теперь запустите сам скрипт в терминале:
    `./typer.sh`
    
По любым вопросам можете связываться со мной в Telegram: @neuroplane.
