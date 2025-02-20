
&НаКлиенте
Процедура АнализГрафика(Команда)
	
      ОткрытьФорму("Документ.ВКМ_ГрафикОтпусков.Форма.АнализГрафика", Новый Структура ("АдресВХ", АдресВХ));
      
КонецПроцедуры

&НаКлиенте
Процедура ОтпускаСотрудниковДатаНачалаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.ОтпускаСотрудников.ТекущиеДанные;
	
	ТекущиеДанные.КоличествоДнейОтпуска = (НачалоДня(ТекущиеДанные.ДатаОкончания) - НачалоДня(ТекущиеДанные.ДатаНачала)) / (60 * 60 * 24);
	
КонецПроцедуры

&НаКлиенте
Процедура ОтпускаСотрудниковДатаОкончанияПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.ОтпускаСотрудников.ТекущиеДанные;
	
	ТекущиеДанные.КоличествоДнейОтпуска = (НачалоДня(ТекущиеДанные.ДатаОкончания) - НачалоДня(ТекущиеДанные.ДатаНачала)) / (60 * 60 * 24);

КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УстановитьУсловноеОформление();
	
	ТаблицаЗначенийОтпускаСотрудников = Объект.ОтпускаСотрудников.Выгрузить(); 
	АдресВХ = ПоместитьВоВременноеХранилище(ТаблицаЗначенийОтпускаСотрудников , УникальныйИдентификатор);
	
КонецПроцедуры

&НаСервере
Процедура УстановитьУсловноеОформление()
	
		УсловноеОформление.Элементы.Очистить();	
 		ЭлементОформления = УсловноеОформление.Элементы.Добавить();
 		
		ЭлементОтбора = ЭлементОформления.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Объект.ОтпускаСотрудников.КоличествоДнейОтпуска");
		ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Больше;
		ЭлементОтбора.ПравоеЗначение = 28;
		ЭлементОтбора.Использование = Истина;	
			
		ЭлементОформления.Оформление.УстановитьЗначениеПараметра("ЦветФона", WebЦвета.Аквамарин);
		ЭлементОформления.Использование = Истина;
		
		ПолеОформления = ЭлементОформления.Поля.Элементы.Добавить();
		ПолеОформления.Поле = Новый ПолеКомпоновкиДанных("ОтпускаСотрудниковСотрудник");
		ПолеОформления.Использование = Истина;
							
КонецПроцедуры
 
  




