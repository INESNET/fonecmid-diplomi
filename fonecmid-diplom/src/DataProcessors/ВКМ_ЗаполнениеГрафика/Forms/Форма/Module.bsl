
&НаСервере
Процедура ЗаполнитьНаСервере()
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
    ОбработкаОбъект.ЗаполнитьГрафик(ВыборПериода.ДатаНачала, ВыборПериода.ДатаОкончания, ВыходныеДни);

КонецПроцедуры

&НаКлиенте
Процедура Заполнить(Команда)
	
	ЗаполнитьНаСервере();	
	Сообщить("Обработка завершена!");
	
КонецПроцедуры
