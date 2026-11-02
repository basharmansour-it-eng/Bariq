import 'package:bariq/controller/app/cars_controller.dart';
import 'package:bariq/core/constant/const.dart';
import 'package:bariq/core/router/app_routes.dart';
import 'package:bariq/view/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/car_model.dart';
import '../widgets/car_card.dart';
import '../widgets/primary_button.dart';

class CarsView extends GetView<CarsController> {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile_my_cars'.tr)),
      body: Obx(
        () => controller.cars.isEmpty
            ?  EmptyState(
  icon: Icons.directions_car_rounded,
  title: 'cars_empty_title'.tr,
  description: 'cars_empty_desc'.tr,
)
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                itemCount: controller.cars.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final car = controller.cars[i];
                  return CarCard(
                    car: car,
                    onSetDefault: () => controller.setDefault(car.id),
                    onDelete: () => _confirmDelete(car),
                  );
                },
              ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: PrimaryButton(
            text: 'add_car'.tr,
            onPressed: () => Get.toNamed(Routes.addCar),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(CarModel car) {
    Get.dialog(
      AlertDialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'delete_car_title'.tr,
          style: TextStyle(
            fontFamily: cairo,
            fontWeight: FontWeight.w800,
            color: darkNavy,
          ),
        ),
        content: Text(
          'delete_car_confirm'.trParams({'car': car.title}),
          style: TextStyle(fontFamily: cairo, color: darkNavy),
        ),
        actions: [
          TextButton(onPressed: Get.back, child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              Get.back();
              controller.deleteCar(car.id);
            },
            child: Text(
              'delete'.tr,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}


