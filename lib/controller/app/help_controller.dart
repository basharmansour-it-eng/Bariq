import 'package:bariq/core/constant/support_config.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';



class HelpController extends GetxController {
  Future<void> openWhatsapp() {
    final text = Uri.encodeComponent('help_whatsapp_text'.tr);
    return _open(
        Uri.parse('https://wa.me/${SupportConfig.whatsapp}?text=$text'));
  }

  Future<void> callSupport() {
    return _open(Uri(scheme: 'tel', path: SupportConfig.phone));
  }

  Future<void> emailSupport() {
    final subject = Uri.encodeComponent('help_email_subject'.tr);
    return _open(
        Uri.parse('mailto:${SupportConfig.email}?subject=$subject'));
  }

  void openLegal() => Get.toNamed(Routes.legal);

  Future<void> _open(Uri uri) async {
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok) _failed();
    } catch (_) {
      _failed();
    }
  }

  void _failed() {
    Get.snackbar('app_name'.tr, 'help_open_failed'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }
}