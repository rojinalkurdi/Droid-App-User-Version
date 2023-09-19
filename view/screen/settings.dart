import 'package:flutter/material.dart';
import 'package:gapp01/controller/settings_controller.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      //height: 250,
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 10,
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.addressView);
              },
              title: Text(
                "Address",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.location_on,
                color: AppColors.darkYellow,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.addressView);
              },
              title: Text(
                "Profile",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.person_outline,
                color: AppColors.darkYellow,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.archivedOrders);
              },
              title: Text(
                "Archived orders",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.location_on,
                color: AppColors.darkYellow,
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "About us",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.groups_outlined,
                color: AppColors.darkYellow,
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "contact us",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.call,
                color: AppColors.darkYellow,
              ),
            ),
            ListTile(
              onTap: () {
                controller.logout();
              },
              title: Text(
                "logout",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: const Icon(
                Icons.logout_outlined,
                color: AppColors.darkYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
