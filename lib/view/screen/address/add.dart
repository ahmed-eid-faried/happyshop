import 'package:happyshop/controller/address/add_address_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:flutter_map/plugin_api.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD YOUR ADDRESS"),
      ),
      body: GetBuilder<AddAddressController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      center: controller.latLng!,
                      zoom: 14.5,
                      onTap: (tapPosition, point) {
                        controller.addMarker(point);
                      },
                    ),
                    nonRotatedChildren: const [],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: controller.markers),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.continueFun();
                    },
                    child: const Text("Continue"),
                  ),
                ),
                Positioned(
                    top: 5,
                    child: GetPlatform.isMobile
                        ? SizedBox(
                            width: 0.6 * Get.width,
                            child: TextFormField(
                              controller: controller.controllerSearch,
                              decoration: InputDecoration(
                                  label: const Text("enter your locatin"),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller
                                            .getLatLngFromDescriptionkkk();
                                      },
                                      icon: const Icon(Icons.search))),
                            ),
                          )
                        : const Text(""))
              ],
            ));
      }),
    );
  }
}
