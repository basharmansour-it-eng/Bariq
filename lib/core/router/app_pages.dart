import 'package:bariq/view/screens/home_page.dart';
import 'package:bariq/view/screens/splash_view.dart';
import 'package:bariq/core/binding/home_binding.dart';
import 'package:bariq/core/binding/splash_binding.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
