import 'package:flutter/foundation.dart';
import 'package:happyshop/controller/settings.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardSetting extends StatelessWidget {
  const CustomCardSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 15),
          GetBuilder<SettingControllerImp>(
            builder: (controller) => ListTile(
              onTap: () {
                Get.toNamed(AppRoute.notifications);
              },
              trailing: Switch(
                  value: controller.notificationState!,
                  onChanged: (value) {
                    controller.notification(value);
                  }),
              title: const Text("Notifiactions"),
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.shopify_sharp),
            title: const Text("Orders"),
            onTap: () {
              controller.orders();
            },
          ),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.shopping_basket),
            title: const Text("Archive"),
            onTap: () {
              controller.archive();
            },
          ),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.location_searching_outlined),
            title: const Text("Address"),
            onTap: () {
              controller.address();
            },
          ),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.help_outline_rounded),
            title: const Text("About us"),
            onTap: () {
              controller.aboutus();
            },
          ),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.phone_android_outlined),
            title: const Text("Contact us"),
            onTap: () {
              controller.contactus();
            },
          ),
          if (kDebugMode) const SizedBox(height: 15),
          if (kDebugMode)
            ListTile(
                trailing: const Icon(Icons.error_outline),
                title: const Text("Throw Test Exception"),
                onTap: () => throw Exception()),
          const SizedBox(height: 15),
          ListTile(
            trailing: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              controller.logout();
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
