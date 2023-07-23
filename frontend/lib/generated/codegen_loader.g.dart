// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "smart_booking": "Smart booking",
  "book_property": "Book property",
  "amount": "Amount",
  "choose_date": "Choose date",
  "arrival_date": "Arrival date",
  "departure_date": "Departure date",
  "description": "Description",
  "address": "Address",
  "price": "Price",
  "not_specified": "Not specified",
  "explore": "Explore",
  "my_bookings": "My bookings",
  "my_properties": "My properties",
  "places_for_rent": "Places for rent",
  "choose_dates": "Choose dates",
  "login_with_metamask": "Login with Metamask",
  "you_have_no_bookings": "You have no bookings yet",
  "you_have_no_properties": "You have no properties yet"
};
static const Map<String,dynamic> ru = {
  "smart_booking": "Smart booking",
  "book_property": "Забронировать",
  "amount": "Итого",
  "choose_date": "Выберите дату",
  "arrival_date": "Дата заезда",
  "departure_date": "Дата выезда",
  "description": "Описание",
  "address": "Адрес",
  "price": "Цена",
  "not_specified": "Не указано",
  "explore": "Обзор",
  "my_bookings": "История брони",
  "my_properties": "Мое имущество",
  "places_for_rent": "Список домов, квартир",
  "choose_dates": "Выберете даты",
  "login_with_metamask": "Войти с Metamask",
  "you_have_no_bookings": "У вас еще нет броней",
  "you_have_no_properties": "У вас еще нет объявлений"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
