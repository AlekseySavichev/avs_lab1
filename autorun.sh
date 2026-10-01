rm -rf claude_monet final_menu

echo "Пункт 1: Создание структуры дерева каталогов и файлов"
mkdir -p claude_monet/kitchen/hot_station
mkdir -p claude_monet/kitchen/pastry_station
mkdir -p claude_monet/hall
mkdir -p claude_monet/bar
mkdir -p claude_monet/office
mkdir -p claude_monet/locker_room

echo -e "Сеня готовит мясо для банкета\nПроверяет температуру горячего цеха\nПосле смены считает оставшиеся продукты" > claude_monet/kitchen/hot_station/senya_task
echo -e "Федя разделывает рыбу для гостей\nГотовит фирменную закуску вместе с Сеней\nПеред подачей зовёт Баринова" > claude_monet/kitchen/hot_station/fedya_task
echo -e "Луи выпекает коржи для мильфея\nГотовит крем по старому рецепту\nОставляет один десерт для команды" > claude_monet/kitchen/pastry_station/lui_dessert
echo -e "Катя предлагает новый шоколадный десерт\nБаринов просит уменьшить количество сахара\nПробную порцию получает Макс" > claude_monet/kitchen/pastry_station/katya_idea
echo -e "Баринов собирает всю команду перед сменой\nКаждый повар отвечает за своё рабочее место\nЛёва контролирует выдачу блюд" > claude_monet/kitchen/barinov_order
echo -e "Настя обслуживает столики у окна\nОфицианты встречают гостей в главном зале\nОсобые просьбы гостей передают Вике" > claude_monet/hall/waiter_plan
echo -e "Костя проверил запас напитков\nДля вечера подготовлены новые коктейли\nБар откроется одновременно с залом" > claude_monet/bar/kostya_report
echo -e "Настя просит Костю не опаздывать\nПосле смены они ужинают вместе\nДля гостей оставлены чистые бокалы" > claude_monet/bar/nastya_note
echo -e "Вика проверила кухню и главный зал\nКоманда готова к вечерней смене\nОтчёт нужно передать Нагиеву" > claude_monet/office/vika_summary
echo -e "Макс придумал новое блюдо для меню\nБаринов разрешил приготовить пробную порцию\nВика ждёт Макса после смены" > claude_monet/locker_room/max_note
echo -e "Лёва проверяет форму новых поваров\nКлюч от кладовой лежит у шефа\nПоследним кухню закрывает су-шеф" > claude_monet/locker_room/leva_note

echo "Пункт 2: Установка прав доступа"
chmod 755 claude_monet
chmod 750 claude_monet/kitchen
chmod 750 claude_monet/kitchen/hot_station
chmod 640 claude_monet/kitchen/hot_station/senya_task
chmod 640 claude_monet/kitchen/hot_station/fedya_task
chmod 750 claude_monet/kitchen/pastry_station
chmod 644 claude_monet/kitchen/pastry_station/lui_dessert
chmod 644 claude_monet/kitchen/pastry_station/katya_idea
chmod 640 claude_monet/kitchen/barinov_order
chmod 750 claude_monet/hall
chmod 644 claude_monet/hall/waiter_plan
chmod 750 claude_monet/bar
chmod 640 claude_monet/bar/kostya_report
chmod 640 claude_monet/bar/nastya_note
chmod 750 claude_monet/office
chmod 640 claude_monet/office/vika_summary
chmod 750 claude_monet/locker_room
chmod 640 claude_monet/locker_room/max_note
chmod 644 claude_monet/locker_room/leva_note

echo "Пункт 3: Операции с файлами, ссылками и каталогами"
cp claude_monet/locker_room/max_note claude_monet/office/max_report
cp -r claude_monet/bar claude_monet/hall/bar_backup
ln -s claude_monet/kitchen/barinov_order final_menu
ln -s ../kitchen claude_monet/office/kitchen_access
ln claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/senya_task_copy
cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/fedya_task > claude_monet/kitchen/cook_tasks
cat claude_monet/hall/waiter_plan >> claude_monet/office/vika_summary
mv claude_monet/locker_room/max_note claude_monet/kitchen/max_final_note

echo "Пункт 4: Поиск, фильтрация и обработка данных"
echo "4.1:"
ls -laR | grep '^-' | sort -k5 -n -r | head -n 5
echo "4.2:"
grep -r -i -h -E 'баринов|макс' claude_monet/ | grep -v -i 'порц' | sort | head -n 6
echo "4.3:"
grep -r -l -i -E 'кост|наст' claude_monet/bar claude_monet/hall/bar_backup | wc -l
echo "4.4:"
(head -q -n 1 claude_monet/kitchen/hot_station/*_task && tail -q -n 1 claude_monet/kitchen/hot_station/*_task) | grep -i -E 'сеня|федя|продукт' | sort -r
echo "4.5:"
grep -v -E 'Сеня|Федя' claude_monet/kitchen/cook_tasks | sort -r | head -n 4 | wc -w
echo "4.6:"
ls -laRi | grep -E '^[0-9]+ -[^ ]+ +2 ' | sort -k1 -n
echo "4.7:"
ls -laR | grep '^l' | grep -v 'final' | sort -k9
echo "Пункт 5: Удаление файлов, ссылок и каталогов"
rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rmdir claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -r claude_monet/hall/bar_backup

echo "Все пункты сценария успешно выполнены!"
