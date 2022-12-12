﻿#language: ru

@tree

Функционал: создание документа Поступления товаров

Как Менеджер по закупкам я хочу
создание документа поступления товаров 
чтобы поставить товар на учет
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа поступления товаров 
// создание документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
    И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы "Склад" стал равен "Малый"
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Хлеб'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
 	и я нажимаю на кнопку "Записать"
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Цена'  | 'Артикул' | 'Количество' | 'Сумма'  |
		| 'Хлеб'  | '15,00' | 'H987'    | '10,00'      | '150,00' |
* Номер
	И я запоминаю значение поля с именем "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
	   | 'Номер' |
	   | '$Номер$'|
   Сценарий: проверка наличия в справочнике номенклатуры Хлеб
   И В командном интерфейсе я выбираю 'Продажи' 'Товары'
   Тогда открылось окно 'Товары'
   И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
	   | 'Наименование' |
	   | 'Хлеб'|
      
