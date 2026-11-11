import 'package:bariq/core/router/app_pages.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/localization/app_translations.dart';
import 'core/localization/locale_controller.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await GetStorage().erase();
  Get.put(LocaleController(), permanent: true);
  runApp(const Bariq());
}

class Bariq extends StatelessWidget {
  const Bariq({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bariq',
      theme: AppTheme.light,

      // الترجمة واللغة
      translations: AppTranslations(),
      locale: localeController.locale,
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      // هذه الـ delegates ضرورية ليعمل اتجاه RTL مع العربية
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // المسارات
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
