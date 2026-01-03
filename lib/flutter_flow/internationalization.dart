import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // place
  {
    '1p7x6wl1': {
      'ar': 'عنوان القهوة',
      'en': '',
    },
    '5u6i3kng': {
      'ar': 'كــافـــــيــــــه ',
      'en': '',
    },
    'typllw45': {
      'ar': 'العوالي ، مكة المكرمة ',
      'en': '',
    },
    'em158agf': {
      'ar': '4.8 (324 تقييم)',
      'en': '',
    },
    'ofzkhnzf': {
      'ar': ' (متوسط سعر الشخص )',
      'en': '',
    },
    'orhako1o': {
      'ar': '55  ',
      'en': '',
    },
    '0jiocmxq': {
      'ar': 'مؤشرات الثقة ',
      'en': '',
    },
    'gib9c885': {
      'ar': 'المزيد من التفاصيل ',
      'en': '',
    },
    'uaqxab00': {
      'ar': 'الأفضل سعرًا بالقرب منك ! ',
      'en': '',
    },
    'cg576w3i': {
      'ar': 'كافيه لافندر ',
      'en': '',
    },
    'fzp1ytc0': {
      'ar': '42 ',
      'en': '',
    },
    'pn3bjf7w': {
      'ar': 'ريال',
      'en': '',
    },
    '8oopjkea': {
      'ar': '(0.8 كم ) من موقعك الحالي ',
      'en': '',
    },
    'd9sgyolc': {
      'ar': 'أرخص بـ13 ريال من المتوسط ',
      'en': '',
    },
    '9l4mz1dr': {
      'ar': 'يشمل مشروب ساخن + حلا صغير ',
      'en': '',
    },
    'mbqo3soa': {
      'ar': 'ريال',
      'en': '',
    },
    'oghtrd0g': {
      'ar': 'مؤشرات الثقة ',
      'en': '',
    },
    'b2rm4r75': {
      'ar': 'مؤشرات الثقة ',
      'en': '',
    },
    'icjnptcg': {
      'ar': 'مؤشرات الثقة ',
      'en': '',
    },
    'oodnx34o': {
      'ar': 'Home',
      'en': '',
    },
  },
  // splash
  {
    '8iyh0rvp': {
      'ar': 'اختــيــــارك الذكــــــــــي .. يصنــــــع الفــــــرق',
      'en': '',
    },
    '41dbt9jr': {
      'ar': 'Home',
      'en': '',
    },
  },
  // ProfilePage
  {
    'o3il56xu': {
      'ar': 'الاشعارات ',
      'en': '',
    },
    '5w7q8yup': {
      'ar': 'الحماية و الخصوصية',
      'en': '',
    },
    'pu3kwbfx': {
      'ar': 'حول الأن ',
      'en': '',
    },
    'wsq1w9ky': {
      'ar': 'المساعدة والدعم ',
      'en': '',
    },
    '82fnlzn8': {
      'ar': 'تسجيل الخروج',
      'en': '',
    },
    'mefxkbyf': {
      'ar': 'صفحتي ',
      'en': '',
    },
  },
  // Welcompage
  {
    'shk94qjz': {
      'ar': 'الآن، المنصة الأولى في مكة — اكتشف، استشر، وثق',
      'en': '',
    },
    'luau4qrx': {
      'ar': 'اختــيــــارك الذكــــــــــي .. يصنــــــع الفــــــرق',
      'en': '',
    },
    'zau72cj3': {
      'ar': '   ابدأ رحلتك   ',
      'en': '',
    },
    'v3cihv7w': {
      'ar': 'تسجيـــل دخــــول ',
      'en': '',
    },
    '85oioszu': {
      'ar': 'Home',
      'en': '',
    },
  },
  // LogIN
  {
    'rzdb8g06': {
      'ar': 'تسجيــل الدخـــول ',
      'en': '',
    },
    'hortt1rh': {
      'ar': 'البريد الإلكتروني',
      'en': '',
    },
    '5yu011dj': {
      'ar': 'أدخل بريدك الإلكتروني ',
      'en': '',
    },
    'rseph1yd': {
      'ar': 'كلمة المــرور',
      'en': '',
    },
    '0iwj826f': {
      'ar': 'أدخل كلمة المرور         ',
      'en': '',
    },
    'hhf4b6e3': {
      'ar': 'نسيت كلمة المرور؟',
      'en': '',
    },
    'w3nidemj': {
      'ar': 'دخـــول',
      'en': '',
    },
    '1if7nifl': {
      'ar': 'ليس لديك حساب ؟  ',
      'en': '',
    },
    'spyf2ui3': {
      'ar': 'إنشاء حساب جديد',
      'en': '',
    },
    's2foyo7u': {
      'ar': 'أو',
      'en': '',
    },
    'xrilh0wa': {
      'ar': ' الدخول باستخدام Google',
      'en': '',
    },
    'vip2expi': {
      'ar': ' الدخول باستخدام Apple',
      'en': '',
    },
    'gq7pjatb': {
      'ar': 'حقل مطلوب',
      'en': '',
    },
    '1o8rcgdn': {
      'ar': 'يرجى إدخال بريد إلكتروني صحيح مثل example@email.com',
      'en': '',
    },
    'rcli4ptb': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '76q0yte5': {
      'ar': 'حقل مطلوب',
      'en': '',
    },
    'nt0ue7nm': {
      'ar': 'كلمة المرور قصيرة، يرجى إدخال 6 أحرف أو أكثر',
      'en': '',
    },
    'de7ic4nc': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // helppage
  {
    '4xbjxg16': {
      'ar': 'check.io',
      'en': '',
    },
    'ww2i33gh': {
      'ar': 'Andrew D.',
      'en': '',
    },
    's625e3fo': {
      'ar': 'admin@gmail.com',
      'en': '',
    },
    'smaka0j1': {
      'ar': 'Dashboard',
      'en': '',
    },
    'szuwj5qk': {
      'ar': 'Transactions',
      'en': '',
    },
    '6ufnt1zx': {
      'ar': 'Projects',
      'en': '',
    },
    '0x344rch': {
      'ar': 'Users',
      'en': '',
    },
    'yzhcpvxv': {
      'ar': 'المساعدة والدعم ',
      'en': '',
    },
    '8gq1tz9y': {
      'ar': 'الآسئلة الشائعة ',
      'en': '',
    },
    'gk7thiw0': {
      'ar': 'كيف يعمل رادار الأسعار؟',
      'en': '',
    },
    'ifswya5b': {
      'ar':
          'يمكنك تصوير السعر أو إدخاله، وسيقوم النظام بمقارنته بأسعار السوق واقتراح البدائل المناسبة.',
      'en': '',
    },
    '7bc66j3c': {
      'ar': 'كيف أختار المكان المناسب بثقة؟',
      'en': '',
    },
    'z71o00w9': {
      'ar':
          'تعتمد منصة \" الآن\" على آراء المستخدمين، الجيران، الخبراء، وتحليل ذكي لمساعدتك على اتخاذ القرار الصحيح.',
      'en': '',
    },
    'v807a52d': {
      'ar': 'هل التقييمات موثوقة؟',
      'en': '',
    },
    '69qote6f': {
      'ar': 'التقييمات مبنية على نظام متعدد المصادر لضمان الشفافية والدقة.',
      'en': '',
    },
    'lre3qfkn': {
      'ar': 'هل التقييمات موثوقة؟',
      'en': '',
    },
    '00t8qda4': {
      'ar': 'التقييمات مبنية على نظام متعدد المصادر لضمان الشفافية والدقة.',
      'en': '',
    },
    'dynpxb8r': {
      'ar': 'هل التقييمات موثوقة؟',
      'en': '',
    },
    'nv4xvpd7': {
      'ar': 'التقييمات مبنية على نظام متعدد المصادر لضمان الشفافية والدقة.',
      'en': '',
    },
    'v79q9h0k': {
      'ar': 'هل التقييمات موثوقة؟',
      'en': '',
    },
    'kc4qsdqc': {
      'ar': 'التقييمات مبنية على نظام متعدد المصادر لضمان الشفافية والدقة.',
      'en': '',
    },
    'cbghrmg9': {
      'ar': 'تواصل معنا',
      'en': '',
    },
    'a7dl7mio': {
      'ar':
          'ساعات العمل\n\nالأحد–الخميس من 9 صباحًا إلى 5 مساءً\nاتصل بنا\n\ncontactus@alan.com\n80010007000\nالموقع\n\nالان شركة التطوير المحدودة\n3252 شارع الأمير محمد بن عبدالعزيز (التحلية)\nمجمع النعيم التجاري رقم 4 – الدور الثاني – جادة 30\nمكة 12241-6231\n',
      'en': '',
    },
    'nx3o425j': {
      'ar': 'My Channels / Task / Task #4234',
      'en': '',
    },
    '8q4v5r4q': {
      'ar': 'Update our command Palette to be more usable.',
      'en': '',
    },
    'cvvw602d': {
      'ar': 'Subtasks',
      'en': '',
    },
    'zwpjcpb5': {
      'ar': '0 tasks',
      'en': '',
    },
    '99viqzhe': {
      'ar': 'Created',
      'en': '',
    },
    'ofklywvf': {
      'ar': 'Created',
      'en': '',
    },
    'q7ks3lip': {
      'ar': 'Due Date',
      'en': '',
    },
    'all2q4yr': {
      'ar': '10 Jan, 2023',
      'en': '',
    },
    'm4onn4lj': {
      'ar': 'Categories',
      'en': '',
    },
    'e7xum7as': {
      'ar': 'Design System',
      'en': '',
    },
    'zvly791m': {
      'ar': 'Product',
      'en': '',
    },
    'p3t16jb0': {
      'ar': 'Description',
      'en': '',
    },
    'd4r4mytp': {
      'ar': 'Leave a note here...',
      'en': '',
    },
    'md58ulzj': {
      'ar': 'Post Note',
      'en': '',
    },
    'q1r9mmb0': {
      'ar': 'Home',
      'en': '',
    },
  },
  // home
  {
    'wbuxtgmf': {
      'ar': 'TextField',
      'en': '',
    },
    '2sx02uu3': {
      'ar': 'اكتشف ..',
      'en': '',
    },
    'do62p87q': {
      'ar': 'تصفح',
      'en': '',
    },
    'mlyb4l8l': {
      'ar': 'الأفضل سعرًا بالقرب منك ! ',
      'en': '',
    },
    '12os36a8': {
      'ar': 'اكتشف كافيه بأسعار أوفر من غيره ',
      'en': '',
    },
    '5um2zn7d': {
      'ar': 'تصفح',
      'en': '',
    },
    'n29lc46p': {
      'ar': 'الرئيسية ',
      'en': '',
    },
  },
  // createaccount
  {
    'p18t5lij': {
      'ar': 'إنشاء حساب جديد',
      'en': '',
    },
    'rba7ef0y': {
      'ar': 'أدخل بياناتك لإنشاء حساب جديد',
      'en': '',
    },
    'woebyq9r': {
      'ar': 'البريد الإلكتروني',
      'en': '',
    },
    'hgzzfeao': {
      'ar': 'أدخل بريدك الإلكتروني',
      'en': '',
    },
    'owf13z5p': {
      'ar': 'كلمة المرور',
      'en': '',
    },
    'ic9prp36': {
      'ar': 'أدخل كلمة المرور',
      'en': '',
    },
    'j645m98r': {
      'ar': 'تأكيد كلمة المرور',
      'en': '',
    },
    'on92t1mz': {
      'ar': 'أعد إدخال كلمة المرور',
      'en': '',
    },
    'f7ul6a34': {
      'ar': 'كلمة المرور غير متطابقة',
      'en': '',
    },
    'rxeehx82': {
      'ar': 'نوع الحساب',
      'en': '',
    },
    '1mnxg4bo': {
      'ar': 'اختر نوع الحساب',
      'en': '',
    },
    '3p98h10x': {
      'ar': 'تاجر',
      'en': '',
    },
    'k33vpss5': {
      'ar': 'خبير',
      'en': '',
    },
    'lbzzgj1k': {
      'ar': 'مستخدم',
      'en': '',
    },
    '5yx4elav': {
      'ar': 'الإدارة',
      'en': '',
    },
    'd6dasgbo': {
      'ar': 'يجب اختيار نوع الحساب ',
      'en': '',
    },
    'hvvk7o7a': {
      'ar': 'حقل مطلوب',
      'en': '',
    },
    'je2nm1y4': {
      'ar': 'يرجى إدخال بريد إلكتروني صحيح مثل example@email.com',
      'en': '',
    },
    'c1myom5w': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '3utbfu3s': {
      'ar': 'حقل مطلوب ',
      'en': '',
    },
    'n3x4bbhe': {
      'ar': 'كلمة المرور قصيرة، يرجى إدخال 6 أحرف أو أكثر',
      'en': '',
    },
    'hcxtjr5d': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'yc7yejvk': {
      'ar': 'أعد إدخال كلمة المرور is required',
      'en': '',
    },
    'hknfx7u0': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'aniqlhjg': {
      'ar': 'إنشاء حساب',
      'en': '',
    },
    'amywuhro': {
      'ar': 'أو',
      'en': '',
    },
    'knzgqedu': {
      'ar': ' التسجيل باستخدام Google',
      'en': '',
    },
    'herr8l8c': {
      'ar': ' التسجيل باستخدام Apple',
      'en': '',
    },
    '5y2cisab': {
      'ar': 'لديك حساب بالفعل؟',
      'en': '',
    },
    'mnefpnh8': {
      'ar': 'تسجيل الدخول',
      'en': '',
    },
  },
  // Ai
  {
    'sl793xqf': {
      'ar': 'اضغط للانتقال إلى موقع التحليل الذكي ومقارنة أفضل الأسعار',
      'en': '',
    },
    'd290t914': {
      'ar': 'المحــــــــــلل الذكـــــــــي ',
      'en': '',
    },
    'au4exj3o': {
      'ar': 'انتقل الآن ',
      'en': '',
    },
    '22a721z4': {
      'ar': 'تحليل ذكي',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'svtjneud': {
      'ar':
          'This app requires access to the camera to allow users to take photos and scan codes within the app.',
      'en': '',
    },
    '9jhyvqh6': {
      'ar': '',
      'en': '',
    },
    'raifxsfz': {
      'ar': '',
      'en': '',
    },
    '48n97q6r': {
      'ar': '',
      'en': '',
    },
    'zunrhxa0': {
      'ar': '',
      'en': '',
    },
    'el5kk1g3': {
      'ar': '',
      'en': '',
    },
    'ibp1et5u': {
      'ar': '',
      'en': '',
    },
    'y7i6t7ju': {
      'ar': '',
      'en': '',
    },
    '79jloibo': {
      'ar': '',
      'en': '',
    },
    'mdnn0nd8': {
      'ar': '',
      'en': '',
    },
    'ljn0w7xv': {
      'ar': '',
      'en': '',
    },
    'pxy92lm1': {
      'ar': '',
      'en': '',
    },
    '2eyff439': {
      'ar': '',
      'en': '',
    },
    'gl19j281': {
      'ar': '',
      'en': '',
    },
    '4b9e5hnd': {
      'ar': '',
      'en': '',
    },
    'ctkqrsqj': {
      'ar': '',
      'en': '',
    },
    '2f8u57nz': {
      'ar': '',
      'en': '',
    },
    '8naeqqng': {
      'ar': '',
      'en': '',
    },
    'vx8qkhat': {
      'ar': '',
      'en': '',
    },
    'yp0oluix': {
      'ar': '',
      'en': '',
    },
    'g6og8nqy': {
      'ar': '',
      'en': '',
    },
    '8d91kcu8': {
      'ar': '',
      'en': '',
    },
    '6mvxurhl': {
      'ar': '',
      'en': '',
    },
    '9kgrqes3': {
      'ar': '',
      'en': '',
    },
    'gwy7pti7': {
      'ar': '',
      'en': '',
    },
    '4tox5nb1': {
      'ar': '',
      'en': '',
    },
    'kwih832t': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
