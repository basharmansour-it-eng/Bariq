import 'package:bariq/controller/app/addresses_controller.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/confirm_dialog.dart';
import '../../model/address_model.dart';
import '../widgets/address_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/primary_button.dart';

class AddressesView extends GetView<AddressesController> {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile_addresses'.tr)),
      body: Obx(
        () => controller.addresses.isEmpty
            ? EmptyState(
                icon: Icons.location_on_rounded,
                title: 'addresses_empty_title'.tr,
                description: 'addresses_empty_desc'.tr,
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                itemCount: controller.addresses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final address = controller.addresses[i];
                  return AddressCard(
                    address: address,
                    onSetDefault: () => controller.setDefault(address.id),
                    onDelete: () => _delete(address),
                  );
                },
              ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: PrimaryButton(
            text: 'add_address'.tr,
            onPressed: () => Get.toNamed(Routes.addAddress),
          ),
        ),
      ),
    );
  }

  Future<void> _delete(AddressModel address) async {
    final ok = await confirmDialog(
      title: 'delete_address_title'.tr,
      message: 'delete_address_confirm'.trParams({
        'name': address.type.labelKey.tr,
      }),
      confirmText: 'delete'.tr,
    );
    if (ok) controller.deleteAddress(address.id);
  }
}
