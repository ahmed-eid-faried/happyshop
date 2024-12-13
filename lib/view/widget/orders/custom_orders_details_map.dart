import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:happyshop/controller/orders/order_details_controller.dart';
import 'package:happyshop/core/constant/color.dart';

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
          initialCenter: controller.latLng!,
          initialZoom: 14.5),
      // nonRotatedChildren: const [],
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
              child: Icon(
                Icons.location_on,
                size: 40,
                color: AppColor.primaryColor,
              ))
        ]),
      ],
    );
  }
}
