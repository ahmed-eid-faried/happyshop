import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/controller/orders/tracking_controller.dart';
import 'package:happyshop/view/widget/orders/tracking/custom_call_and_done_widet.dart';
import 'package:happyshop/view/widget/orders/tracking/custom_zoom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class TrackingOrderDetails extends StatelessWidget {
  const TrackingOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("Order Tracking"),
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(AppRoute.home);
              },
              icon: const Icon(Icons.arrow_back))),
      body: GetBuilder<TrackingControllerImp>(
        builder: (controller) {
          return Stack(
            children: [
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  child: FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                          center: controller.deliverypositionStart,
                          zoom: controller.zoom),
                      nonRotatedChildren: const [
                        CustomZoomWidget()
                      ],
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(markers: controller.markers),
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: controller.routeCoordinates,
                              color: AppColor.primaryColor,
                              strokeWidth: 3.0,
                            ),
                          ],
                        ),
                      ])),
              if (controller.ordersModel.ordersStatus == "3")
                const CustomCallAndDoneWidet(),
            ],
          );
        },
      ),
    );
  }
}
