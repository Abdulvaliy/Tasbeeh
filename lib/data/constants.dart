import 'package:flutter/material.dart';

Color kMainColor = const Color(0xFF0B4A38);
// CupertinoColors kMainColorCupertino = CupColor // CupertinoColors()

Map<int, Color> colorMap = {
  50: const Color.fromRGBO(147, 205, 72, .1),
  100: const Color.fromRGBO(147, 205, 72, .2),
  200: const Color.fromRGBO(147, 205, 72, .3),
  300: const Color.fromRGBO(147, 205, 72, .4),
  400: const Color.fromRGBO(147, 205, 72, .5),
  500: const Color.fromRGBO(147, 205, 72, .6),
  600: const Color.fromRGBO(147, 205, 72, .7),
  700: const Color.fromRGBO(147, 205, 72, .8),
  800: const Color.fromRGBO(147, 205, 72, .9),
  900: const Color.fromRGBO(147, 205, 72, 1),
};
MaterialColor customColor = MaterialColor(0xFF0B4A38, colorMap);

Map<String, Map> languages = {
  "settings": {
    "en": "Settings",
    "uz": "Sozlamalar",
    "ru": "Настройки",
    "tr": "Ayarlar",
  },
  "save": {
    "en": "Save",
    "uz": "Saqlash",
    "ru": "Сохранить",
    "tr": "KAYIT ETMEK",
  },
  "count": {
    "en": "Count",
    "uz": "Sanoq",
    "ru": "Количество",
    "tr": "Sayısı",
  },
  "custom": {
    "en": "Custom",
    "uz": "Maxsus",
    "ru": "Специальный",
    "tr": "Özel",
  },
  "sound": {
    "en": "Sound",
    "uz": "Ovoz",
    "ru": "Звук",
    "tr": "Ses",
  },
  "vibration": {
    "en": "Vibration",
    "uz": "Tebranish",
    "ru": "Вибрация",
    "tr": "Titreşim",
  },
  "vibration_cycle": {
    "en": "Cycle vibration",
    "uz": "Sikl tebranish",
    "ru": "Цикл вибрации",
    "tr": "Döngü titreşimi",
  },
  "language": {
    "en": "Language",
    "uz": "Til",
    "ru": "Язык",
    "tr": "Dil",
  },
  "english": {
    "en": "English",
    "uz": "Inglizcha",
    "ru": "Английский",
    "tr": "ingilizce",
  },
  "uzbek": {
    "en": "Uzbek",
    "uz": "O'zbekcha",
    "ru": "Узбекский",
    "tr": "Özbekçe",
  },
  "turkish": {
    "en": "Turkish",
    "uz": "Turkcha",
    "ru": "Турецкий",
    "tr": "Türkçe",
  },
  "russian": {
    "en": "Russian",
    "uz": "Ruscha",
    "ru": "Русский",
    "tr": "Rusça",
  },
  "locate": {
    "en": "Locate RESET button on the",
    "uz": """
    "QAYTA O'RNATISH" tugmasining joylashuvi
    """,
    "ru": "Найдите кнопку ПЕРЕУСТАНОВКА на ...",
    "tr": "Üzerindeki SIFIRLAMA düğmesini bul ...",
  },
  "right": {
    "en": "RIGHT",
    "uz": "O'NGDA",
    "ru": "СПРАВО",
    "tr": "SAĞDA",
  },
  "left": {
    "en": "LEFT",
    "uz": "CHAPDA",
    "ru": "СЛЕВО",
    "tr": "SOLDA",
  },
  "version": {
    "en": "Version",
    "uz": "Talqin",
    "ru": "Версия",
    "tr": "Versiyon",
  },
  "support": {
    "en": "Support",
    "uz": "Qo'llab-quvvatlash",
    "ru": "Поддержка",
    "tr": "Destek",
  },
  "get_in_touch": {
    "en": "Get in touch with us",
    "uz": "Biz bilan bog'laning",
    "ru": "Свяжись с нами",
    "tr": "Bizimle temasa geç",
  },
  "phone": {
    "en": "Phone Number",
    "uz": "Telefon raqami",
    "ru": "Номер телефона",
    "tr": "Telefon numarası",
  },
  "email": {
    "en": "Email",
    "uz": "Elektron Pochta",
    "ru": "Эл. адрес",
    "tr": "E-posta",
  },
  "address": {
    "en": "Address",
    "uz": "Manzil",
    "ru": "Адрес",
    "tr": "Adres",
  },
  "address_location": {
    "en": "Dustlik-2 st., Qorasuv, Sergeli district, Tashkent Uzbekistan",
    "uz": "Toshkent shahar, Sergeli tumani, Qorasuv dahasi, Do'stlik-2 mavz...",
    "ru": "г. Ташкент, Сергелийский район, Карасу, Дустлик-2, д...",
    "tr": "Taşkent şehri Sergeli tumani Karasuv dahasi Dostlik-2 mavze...",
  },
  "or_write": {
    "en": "Or write to us",
    "uz": "Yoki bizga yozing",
    "ru": "Или напишите нам",
    "tr": "Ya da bize yazın",
  },
  "name": {
    "en": "Name",
    "uz": "Ism",
    "ru": "Имя",
    "tr": "Ad",
  },
  "message": {
    "en": "Message",
    "uz": "Xabar",
    "ru": "Сообщение",
    "tr": "Mesaj",
  },
  "send": {
    "en": "SEND",
    "uz": "YUBORISH",
    "ru": "ОТПРАВИТЬ",
    "tr": "GÖNDERMEK",
  },
  "information": {
    "en": "Information",
    "uz": "Ma'lumot",
    "ru": "Информация",
    "tr": "Bilgi",
  },
  "terms_conditions": {
    "en": "TERMS & CONDITIONS",
    "uz": "SHARTLAR VA QOIDALAR",
    "ru": "УСЛОВИЯ И ПОЛОЖЕНИЯ",
    "tr": "HÜKÜMLER VE KOŞULLAR",
  },
  "share": {
    "en": "Share",
    "uz": "Ulashish",
    "ru": "Поделиться",
    "tr": "Paylaşmak",
  },
  "soon": {
    "en": "Soon",
    "uz": "Tez kunda",
    "ru": "Скоро",
    "tr": "Yakında",
  },
  "scan_description": {
    "en": "Scan QR to download Tasbeh application",
    "uz": "Tasbeh ilovasini yuklab olish uchun QR-ni skanerlang",
    "ru": "Отсканируйте QR, чтобы загрузить приложение Tasbeh",
    "tr": "Tasbeh uygulamasını indirmek için QR tarayın",
  },
  "dark_mode": {
    "en": "Dark mode",
    "uz": "Qorong'i rejim",
    "ru": "Тёмный режим",
    "tr": "Karanlık mod",
  },
};
