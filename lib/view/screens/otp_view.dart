import 'package:bariq/controller/auth/otp_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/primary_button.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'otp_title'.tr,
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'otp_subtitle'.trParams({'phone': controller.displayPhone}),
                style: TextStyle(
                  fontFamily: cairo,
                  fontSize: 14,
                  height: 1.6,
                  color: darkNavy.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 36),
              _CodeBoxes(controller: controller),
              const SizedBox(height: 24),
              Center(
                child: Obx(
                  () => controller.secondsLeft.value > 0
                      ? Text(
                          'resend_in'.trParams({'time': controller.timeText}),
                          style: TextStyle(
                            fontFamily: cairo,
                            color: darkNavy.withValues(alpha: 0.6),
                          ),
                        )
                      : TextButton(
                          onPressed: controller.resend,
                          child: Text('resend_code'.tr),
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => PrimaryButton(
                  text: 'verify'.tr,
                  isLoading: controller.isLoading.value,
                  onPressed:
                      controller.code.value.length == OtpController.codeLength
                      ? controller.verify
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ستة مربعات تُظهر الرقم المكتوب، وفوقها حقل نص شفاف يستقبل الكتابة فعلياً.
/// هذه الطريقة تعمل بدون أي حزمة إضافية وتدعم اللصق من الرسالة.
class _CodeBoxes extends StatelessWidget {
  final OtpController controller;
  const _CodeBoxes({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: controller.focusNode.requestFocus,
        child: Stack(
          children: [
            Obx(() {
              final code = controller.code.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(OtpController.codeLength, (i) {
                  final filled = i < code.length;
                  final active =
                      i == code.length &&
                      code.length < OtpController.codeLength;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 46,
                    height: 58,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: active
                            ? primaryBlue
                            : filled
                            ? secondaryBlue
                            : lightCyan.withValues(alpha: 0.6),
                        width: active ? 2 : 1.4,
                      ),
                    ),
                    child: Text(
                      filled ? code[i] : '',
                      style: TextStyle(
                        fontFamily: cairo,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: darkNavy,
                      ),
                    ),
                  );
                }),
              );
            }),
            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: TextField(
                  controller: controller.codeController,
                  focusNode: controller.focusNode,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  showCursor: false,
                  enableInteractiveSelection: false,
                  autocorrect: false,
                  enableSuggestions: false,
                  onChanged: controller.onCodeChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(OtpController.codeLength),
                  ],
                  decoration: const InputDecoration(
                    counterText: '',
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
