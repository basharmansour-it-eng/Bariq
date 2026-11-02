import 'package:bariq/core/binding/add_address_binding.dart';
import 'package:bariq/core/binding/add_car_binding.dart';
import 'package:bariq/core/binding/main_binding.dart';
import 'package:bariq/core/binding/service_details_binding.dart';
import 'package:bariq/view/screens/add_address_view.dart';
import 'package:bariq/view/screens/add_car_view.dart';
import 'package:bariq/view/screens/addresses_view.dart';
import 'package:bariq/view/screens/cars_view.dart';
import 'package:bariq/view/screens/login_view.dart';
import 'package:bariq/view/screens/main_view.dart';
import 'package:bariq/view/screens/onboarding_view.dart';
import 'package:bariq/view/screens/otp_view.dart';
import 'package:bariq/view/screens/profile_setup_view.dart';
import 'package:bariq/view/screens/service_details_view.dart';
import 'package:get/get.dart';

import '../../View/screens/splash_view.dart';
import '../binding/login_binding.dart';
import '../binding/onboarding_binding.dart';
import '../binding/otp_binding.dart';
import '../binding/profile_setup_binding.dart';
import '../binding/splash_binding.dart';
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
      name: Routes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.profileSetup,
      page: () => const ProfileSetupView(),
      binding: ProfileSetupBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: Routes.cars, page: () => const CarsView()),
    GetPage(
      name: Routes.addCar,
      page: () => const AddCarView(),
      binding: AddCarBinding(),
    ),
    GetPage(
  name: Routes.addresses,
  page: () => const AddressesView(),
),
GetPage(
  name: Routes.addAddress,
  page: () => const AddAddressView(),
  binding: AddAddressBinding(),
),
GetPage(
  name: Routes.serviceDetails,
  page: () => const ServiceDetailsView(),
  binding: ServiceDetailsBinding(),
),
  ];
}
