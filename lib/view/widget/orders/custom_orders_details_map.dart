import 'package:happyshop/controller/orders/order_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class CustomOrdersDetailsMap extends StatelessWidget {
  const CustomOrdersDetailsMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return FlutterMap(
      mapController: controller.mapController,
      options: MapOptions(
          onTap: (tapPosition, point) {
            controller.getPositionOfOrder();
          },
          center: controller.latLng!,
          zoom: 14.5),
      nonRotatedChildren: const [],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(markers: [
          Marker(
              point: controller.latLng!,
              width: 80,
              height: 80,
              builder: (context) => const Icon(
                    Icons.location_on,
                    size: 40,
                    color: AppColor.primaryColor,
                  ))
        ]),
      ],
    );
  }
}
