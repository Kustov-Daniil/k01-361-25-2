#!/bin/bash
# недоделано! 
if [ "$(id -u)" != "0" ]; then
   echo "Ошибка! Скрипт запушен не от root пользователя."
  exit 1
fi
echo ""
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
echo "Описание: Данная программа выводит права пользователя к файлу"
echo ""
echo "Начать выполнение? (y/n): ";
yn='y'
while [ $yn = "y" -o $yn = "Y" ]; do                                             # проверка на наличие файла
                                        read yn; 
                                        if [ $yn = "y" -o $yn = "Y" ]; then
	clear
echo "Введите имя пользователя"
	read USERNAME
	clear 
	while ! [ $(getent passwd $USERNAME ) ]; do                                                 # проверка на наличие пользователя
                           echo "Такого пользователя не существует. Повторить? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите имя пользователя:"
		                                                read USERNAME							
		           elif [ $yn = "n" -o $yn = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
								  echo "Разработчик: Кустов Даниил"
								  echo "Группа: K01-361"
			                                     exit 0
		           else 
		           while ! [ $yn = "n" -o $yn = "N" -o $yn = "y" -o $yn = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yn
		                            if [ $yn = "y" -o $yn = "Y" ]; then
					    clear
		                            echo "Введите имя пользователя:"
		                            read USERNAME
		                            elif [ $yn = "n" -o $yn = "N" ]; then 
		                                                                   echo "Программа завершена!"
									           echo "Разработчик: Кустов Даниил"
								           echo "Группа: K01-361"
			                                                        exit 0
		              fi
		          done
		          fi
	done
	clear
echo "Выберите действие:"
echo "1) Установить дату истечения срока действия пароля"
echo "2) Изменить командную оболочку пользователя"
echo "3) Изменить домашнюю директорию пользователя"
read case1
case "$case1" in
1 )
echo "Установка даты истечения срока действия пароля"
echo ""
echo "Через сколько дней данный пользователь должен сменить пароль?"
read day
passwd -x $day $USERNAME
echo "Завершено! Через $day пользователь $USERNAME должен сменить пароль."
;;
2 ) 
echo "Изменение командной оболочки пользователя"
echo ""
echo "Выберите предпочитаемую командную оболочку"
echo "1) /bin/sh"
echo "2) /bin/bash"
echo "3) /sbin/nologin)"
read case2
case "$case2" in
1)
usermod -s /bin/sh $USERNAME
echo "Изменена командная оболочка пользователя $USERNSME на /bin/sh"
;;
2 )
usermod -s /bin/bash $USERNAME
echo "Изменена командная оболочка пользователя $USERNSME на /bin/bash"
;;
3 ) 
usermod -s /sbin/nologin $USERNAME
echo "Изменена командная оболочка пользователя $USERNSME на /sbin/nologin"
esac;;
3 )
echo "Изменение домашней директории пользователя"
echo "Введите директорию:"
read dir1
if ! [ -d $dir1 ]; then  echo "Такой директории не существует. Хотите создать новую директорию? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите новую директорию:"
read dir1
mkdir $dir1
usermod -d $dir1 $USERNAME
	grp=$(groups $USERNAME)           # группа нашего пользователя
	string3=$grp
	lgg=${#string3}
	let "longg=$lgg-3" #
	let "longg = $longg / 2"   # длина слова группы пользователя
	length3=$longg
	GROUP=${string3:0:length3}
chown $USERNAME:$GROUP $dir1
chmod 777 $dir1

		                                                
		           elif [ $yn = "n" -o $yn = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
							echo "Разработчик: Кустов Даниил"
							echo "Группа: K01-361"			 	 
		                                                  exit 0
		           else 
		           while ! [ $yn = "n" -o $yn = "N" -o $yn = "y" -o $yn = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yn
		                            if [ $yn = "y" -o $yn = "Y" ]; then
					    clear
		                            echo "Введите новую директорию:"
		                            read dir1
		                           usermod -d $dir1 $USERNAME
					grp=$(groups $USERNAME)           # группа нашего пользователя
					string3=$grp
					lgg=${#string3}
					let "longg=$lgg-3" #
					let "longg = $longg / 2"   # длина слова группы пользователя
					length3=$longg
					GROUP=${string3:0:length3}
					chown $USERNAME:$GROUP $dir1
					chmod 700 $dir1

		                            elif [ $yn = "n" -o $yn = "N" ]; then 
										   clear
		                                                                                 echo "Программа завершена!"
									           echo "Разработчик: Кустов Даниил"
									           echo "Группа: K01-361"
		                                                                   exit 0
		                 fi
		          done
		          fi
else 
usermod -d $dir1 $USERNAME
	grp=$(groups $USERNAME)           # группа нашего пользователя
	string3=$grp
	lgg=${#string3}
	let "longg=$lgg-3" #
	let "longg = $longg / 2"   # длина слова группы пользователя
	length3=$longg
	GROUP=${string3:0:length3}
chown $USERNAME:$GROUP $dir1
chmod 700 $dir1
   
		          fi

esac
 echo "Повторить? (y/n): ";
	yn=y
				elif [ $yn = "n" -o $yn = "N" ]; then             
						echo "Прекращено пользователем."
								clear
				else  echo "Ошибка ввода! Введите y/n:"
				      yn=y
				fi
done
clear
echo "Программа завершена!"
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
echo "$GROUP и $USERNAME"
