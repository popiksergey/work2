﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатРасчетаРавенМесяц(Парам01)","РезультатРасчетаРавенМесяц","Тогда Результат расчета равен 381 месяц");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьМесяцРождения2015_11_01()","УМеняЕстьМесяцРождения2015_11_01","Допустим у меня есть месяц рождения 2015-11-01");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьМесяцРасчета2016_08_(Парам01)","УМеняЕстьМесяцРасчета2016_08_","И у меня есть месяц расчета 2016-08-30");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатРасчетаРавенМесяцев(Парам01)","РезультатРасчетаРавенМесяцев","Тогда Результат расчета равен 9 месяцев");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьМесяцРождения1984_11_01()","УМеняЕстьМесяцРождения1984_11_01","Допустим у меня есть месяц рождения 1984-11-01");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьМесяцРождения(Парам01)","УМеняЕстьМесяцРождения","Допустим у меня есть месяц рождения '01.11.2015'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьМесяцРасчета(Парам01)","УМеняЕстьМесяцРасчета","И у меня есть месяц расчета '30.08.2016'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатРасчетаВМесяцахРавен(Парам01)","РезультатРасчетаВМесяцахРавен","Тогда Результат расчета в месяцах равен 9");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим у меня есть месяц рождения "11.2015"
//@УМеняЕстьМесяцРождения(Парам01)
Процедура УМеняЕстьМесяцРождения(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Контекст.Вставить("ДатаРождения", Парам01);
КонецПроцедуры

&НаКлиенте
//И у меня есть месяц расчета "08.2016"
//@УМеняЕстьМесяцРасчета(Парам01)
Процедура УМеняЕстьМесяцРасчета(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Контекст.Вставить("ДатаРасчета", Парам01);
КонецПроцедуры

&НаКлиенте
//Тогда Результат расчета в месяцах равен 9
//@РезультатРасчетаВМесяцахРавен(Парам01)
Процедура РезультатРасчетаВМесяцахРавен(ОжидаемыйРезультат) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Результат = ОбщийМодуль1.ПолучитьРезультатРазницаДатВМесяцах(Контекст.ДатаРождения, Контекст.ДатаРасчета);
	Если НЕ Результат = ОжидаемыйРезультат Тогда
		ВызватьИсключение "Результат расчитан не верно";
	КонецЕсли
КонецПроцедуры

//окончание текста модуля
