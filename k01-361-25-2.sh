#!/bin/bash
# недоделано! 
if [ "$(id -u)" != "0" ]; then
   echo "Ошибка! Скрипт запушен не от root пользователя."
   exit 1
fi

echo "Начать выполнение? (y/n): ";
yesno='y'
while [ $yesno = "y" -o $yesno = "Y" ]; do                                             # проверка на наличие файла
                                        read yesno; 
                                        if [ $yesno = "y" -o $yesno = "Y" ]; then
	clear
echo "Введите имя пользователя"
	read USERNAME
	clear 
	while ! [ $(getent passwd $USERNAME ) ]; do                                                 # проверка на наличие пользователя
                           echo "Такого пользователя не существует. Повторить? (y/n)"
		           read yesno
		           if [ $yesno = "y" -o $yesno = "Y" ]; then
		                                                clear
		                                                echo "Введите имя пользователя:"
		                                                read USERNAME								
		           elif [ $yesno = "n" -o $yesno = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
								  echo "Разработчик: Кустов Даниил"
								  echo "Группа: K01-361"
		                                                  exit 0
		           else 
		           while ! [ $yesno = "n" -o $yesno = "N" -o $yesno = "y" -o $yesno = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yesno
		                            if [ $yesno = "y" -o $yesno = "Y" ]; then
					    clear
		                            echo "Введите имя пользователя:"
		                            read USERNAME
		                            elif [ $yesno = "n" -o $yesno = "N" ]; then 
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
echo ""
echo "1) Выбрать существующую директорию"
echo "2) Создать новую директорию"
read case3
case "$case3" in
1)
echo "Введите директорию:"
read di
	while ! [ -d $di ]; do echo "Такой директории не существует. Повторить? (y/n)"
		           read yesno
		           if [ $yesno = "y" -o $yesno = "Y" ]; then
		                                                clear
		                                                echo "Введите директорию:"
		                                                read f
		           elif [ $yesno = "n" -o $yesno = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
								  echo "Разработчик: Кустов Даниил"
								  echo "Группа: K01-361"
		                                                  exit 0
		           else 
		           while ! [ $yesno = "n" -o $yesno = "N" -o $yesno = "y" -o $yesno = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yesno
		                            if [ $yesno = "y" -o $yesno = "Y" ]; then
					    clear
		                            echo "Введите директорию:"
		                            read di
		                            elif [ $yesno = "n" -o $yesno = "N" ]; then 
										   clear
		                                                                   echo "Программа завершена!"
									           echo "Разработчик: Кустов Даниил"
									           echo "Группа: K01-361"
		                                                                   exit 0
		                                                                   
		                            fi
		          done
		          fi
	done
usermod -d $di $USERNAME
;;
2 ) 
echo "Введите новую директорию:"
read dir1
usermod -d $dir1 $USERNAME
;;
esac


esac
 echo "Повторить? (y/n): ";
	yesno=y
				elif [ $yesno = "n" -o $yesno = "N" ]; then             
						echo "Прекращено пользователем."
						clear
				else  echo "Ошибка ввода! Введите y/n:"
				      yesno=y
				fi
done
clear
echo "Программа завершена!"
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
