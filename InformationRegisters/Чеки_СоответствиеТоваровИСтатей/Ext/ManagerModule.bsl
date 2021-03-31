﻿Процедура ДополнитьСоответствие(Статья, Товар) Экспорт
	Менеджер = РегистрыСведений.Чеки_СоответствиеТоваровИСтатей.СоздатьМенеджерЗаписи();
	Менеджер.Товар = Товар;
	Менеджер.Прочитать();
	
	Если Менеджер.Выбран()
		И Менеджер.Статья = Статья Тогда
			Возврат;
	КонецЕсли;
	
	Менеджер.Товар = Товар;
	Менеджер.Статья = Статья;
	
	Менеджер.Записать(Истина);
КонецПроцедуры

Функция ПолучитьСтатьюПоТовару(Товар) Экспорт
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	Чеки_СоответствиеТоваровИСтатей.Статья КАК Статья
	               |ИЗ
	               |	РегистрСведений.Чеки_СоответствиеТоваровИСтатей КАК Чеки_СоответствиеТоваровИСтатей
	               |ГДЕ
	               |	Чеки_СоответствиеТоваровИСтатей.Товар = &Товар";
	Запрос.УстановитьПараметр("Товар",Товар);
	Результат = Запрос.Выполнить();
	Если Результат.Пустой() Тогда 
		Возврат Неопределено;
	КонецЕсли;
	
	Выборка = Результат.Выбрать();
	Выборка.Следующий();
	Возврат Выборка.Статья;
КонецФункции